require 'date'
require 'base64'
require 'openssl'

module BithumbConnector
  class << self
    BITHUMB_URL = 'https://api.bithumb.com'

    def request(end_point = '/info/account', request_params = {}, api_key = '', secret_key = '')
      url = "#{BITHUMB_URL}#{end_point}"

      nonce = (Time.now.to_f * 1000).to_i
      payload_str = payload_str(end_point, request_params, nonce)

      params = { endpoint: end_point }
      params.merge!(request_params)
      head = header(api_key, signature(secret_key, payload_str), nonce)

      response = HttpPersistent.post(url, params, head)

      return nil if response.status != 200

      JSON.parse(response.body)
    rescue => e
      puts e.message
    end

    def test_query_str(hash)
      query_str('/info/account', hash)
    end

    private
    def payload_str(end_point, request_params, nonce)
      "#{end_point};#{query_str(end_point, request_params)};#{nonce}"
    end

    def query_str(end_point, request_params)
      result_str = "endpoint=#{end_point}"
      if request_params.present?
        request_params.each_key do |key|
          result_str << '&'
          result_str << key.to_s
          result_str << '='
          result_str << request_params[key]
        end
      end
      encoded_str = CGI.escape(result_str)
      encoded_str.gsub!('%20', "+")
      encoded_str.gsub!('%21', "!")
      encoded_str.gsub!('%27', "'")
      encoded_str.gsub!('%28', "(")
      encoded_str.gsub!('%29', ")")
      encoded_str.gsub!('%26', "&")
      encoded_str.gsub!('%3D', "=")
      encoded_str.gsub!('%7E', "~")
      encoded_str
    end

    def signature(secret_key, payload_str)
      Base64.strict_encode64(OpenSSL::HMAC.hexdigest('sha512', secret_key, payload_str))
    end

    def header(api_key, signature, nonce)
      { 'api-client-type' => 2, 'Api-Key' => api_key, 'Api-Sign' => signature, 'Api-Nonce' => nonce}
    end
  end
end
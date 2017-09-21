require 'date'
require 'base64'
require 'openssl'

module CoinoneConnector
  class << self
    def user_info(access_token = 'eed06f38-555c-42f3-9839-59a947122870', secret_key = '03fd3909-12ac-4f70-a0eb-15deebd12e7d')
      url = 'https://api.coinone.co.kr/v2/account/user_info/'
      nonce = DateTime.now.strftime('%Q')
      payload_hash = payload_hash(access_token, nonce)

      payload = Base64.strict_encode64(payload_hash.to_json).chomp
      signature = OpenSSL::HMAC.hexdigest('sha512', secret_key.upcase, payload)

      params = { access_token: access_token, nonce: nonce }

      response = HttpPersistent.post(url, params, header(payload, signature))
      return nil if response.status != 200

      JSON.parse(response.body)
    rescue => e
      puts e.message
    end

    def access_token
      url = 'https://api.coinone.co.kr/oauth/access_token/'
      header = { 'content-type' => 'application/x-www-form-urlencoded'}
      params = { app_id: '745e3d93-b3c2-4154-a723-15d8ef6eaa01',
                app_secret: '266923a6-40ba-46f3-9df5-d8c048166c70',
                request_token: '4cd79e2e-6370-45a9-b1f7-c7eada376503'}

      response = HttpPersistent.post(url, params, header)
      puts response.status
      puts response.body
      return nil if response.status != 200

      JSON.parse(response.body)

    end

    def request_token
      url = 'https://coinone.co.kr/oauth/request_token'
      response = HttpPersistent.get("#{url}?app_id=745e3d93-b3c2-4154-a723-15d8ef6eaa01")
      puts response.status
      puts response.body
      return nil if response.status != 200

      JSON.parse(response.body)
    end

    private
    def base64_encoded_payload(payload)
      Base64.strict_encode64(payload.to_json).chomp
    end

    def payload_hash(access_token, nonce)
      { access_token: access_token, nonce: nonce }
    end

    def header(payload, signature)
      { 'Content-type' => 'application/json', 'X-COINONE-PAYLOAD' => payload, 'X-COINONE-SIGNATURE' => signature }
    end
  end
end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    respond_to do |format|
      # format.json { render json: { result: { message: '동의 완료'} } }
      format.html
    end
  end
end

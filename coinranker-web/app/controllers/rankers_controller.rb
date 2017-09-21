class RankersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def rankers
    render json: User.all
  end
end

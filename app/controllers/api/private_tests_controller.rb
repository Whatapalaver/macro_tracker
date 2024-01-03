class Api::PrivateTestsController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: {
      message: "hello! #{current_user.email}"
    }
  end
end

class Api::JobsController < ApplicationController

  def index
    render json: Job.all
  end

end

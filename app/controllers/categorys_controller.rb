class CategorysController < ApplicationController
  before_action :authenticate_user!
  def index
    flash[:alert] = "god"
  end
end

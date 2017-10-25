class StaticsController < ApplicationController
  def index
    flash[:success] = "Welcome to the Sample App!"
  end
end

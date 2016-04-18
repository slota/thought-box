class UsersController < ApplicationController
  def new
  end

  def create
    redirect_to links_path
  end
end

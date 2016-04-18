class Api::V1::LinksController < ApplicationController
  respond_to :json

  def index
    respond_with Link.order(created_at: :desc)
  end

  def show
    respond_with Link.find_by(id: params[:id])
  end

  def create
    respond_with Link.create(link_params), location: nil
  end

  def upda
    idea = Link.find_by(id: params[:id])
    respond_with link.update(link_params)
  end

  def destroy
    respond_with Link.delete(params[:id])
  end

  private

  def link_params
    params.require(:link).permit(:url, :title, :read)
  end
end

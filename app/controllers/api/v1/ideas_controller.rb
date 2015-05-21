class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    respond_with Idea.all
  end

  def create
    title = params["idea"]["title"]
    body = params["idea"]["body"]
    Idea.create(title: title, body: body)
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.delete
    head :ok
  end

end

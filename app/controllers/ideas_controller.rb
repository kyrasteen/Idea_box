class IdeasController < ApplicationController
  before_action :set_idea

  def edit
  end

  def update
    quality = params["idea"]["quality"].to_i
    title   = params["idea"]["title"]
    body    = params["idea"]["body"]
    redirect_to root_path
    if @idea.update(title: title, body: body, quality: quality)
      flash[:notice] = "idea updated"
    else
      flash[:error] = "incorrect information"
    end
  end

  private

  def set_idea
    @idea = Idea.find(params[:id])
  end

end

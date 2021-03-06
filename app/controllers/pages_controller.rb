class PagesController < ApplicationController

  def index
    pages = Project.find(params[:project_id]).pages
    render json: pages.to_json
  end

  def create
    project = Project.find(params[:project_id])
    page = Page.create(page_params)
    project.pages << page
    render json: page.to_json
  end

  def update
    page = Page.find(params[:id])
    page.update(page_params)
    render json: page.to_json
  end

  def destroy
    page = Page.find(params[:id])
    page.delete
    render json: page.to_json
  end

  def download
    page = Page.find(params[:id])
    render json: page.to_json
  end

  private

  def page_params
    params.require(:page).permit(:name, :text, :description, :left, :top, :height, :width)
  end

end
class ProjectsController < ApplicationController
  before_action :require_login, except: :index
  

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
      if @project.save
        redirect_to projects_url
      else
        render :new
      end
  end

private
  def project_params
    params.require(:project).permit(:title, :description, reward_attributes: [:amount, :description])
  end
end

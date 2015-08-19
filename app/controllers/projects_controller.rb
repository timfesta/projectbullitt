class ProjectsController < ApplicationController

  def index 
    @project = Project.all
    render :index
    end
  
  def create 
    project = current_user.projects.new(project_params)
    project.save
    redirect_to profile_path(current_user)
  end

  def show
    @project = Project.find(params[:id])
    render :show
  end

  def update 
    project = current_user.projects.edit(project_params)
    project.save
    redirect_to profile_path(current_user)
  end

private
  def project_params 
    params.require(:project).permit(:task_id, :status)
  end

end

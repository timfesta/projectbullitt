class ProjectsController < ApplicationController

  # def new 
  #   @project = Project.new
  #   render :new
  # end 

  def create 
    project = current_user.projects.new(project_params)
    project.save
    redirect_to profile_path(current_user)
  end

  def show
    @project = Project.find(params[:id])
    render :show
  end

private
  def project_params 
    params.require(:project).permit(:task_id, :status)
  end

end

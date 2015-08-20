class ProjectsController < ApplicationController

  def index 
    @npo = Npo.find(params[:npo_id])
    @myprojects = @npo.projects.group_by{|p| p.status}
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
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    redirect_to npo_projects_path(@project.task.npo)
  end

private
  
  def project_params 
    params.require(:project).permit(:task_id, :status)
  end

end

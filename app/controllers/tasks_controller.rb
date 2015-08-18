class TasksController < ApplicationController

	def new
		@task = Task.new
		render :new
	end

	def create
		task = current_user.npos.create(task_params)
		redirect_to npo_path(current_user)		
	end


	private
	def task_params
		params.require(:tasks).permit(:issue, :description, :language, :framework)
		
	end

end



class TasksController < ApplicationController

	def index
		@task = Task.all
		render :index
	end 

	def new
		@task = Task.new
		render :new
	end

	def create
		task = Task.create(task_params)
		task.save
		redirect_to task_path(task)		
	end

	def show 
		@task = Task.find(params[:id])
		render :show
	end


	private
	def task_params
		params.require(:task).permit(:issue, :description, :language, :framework)
		
	end

end



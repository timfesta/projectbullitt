class TasksController < ApplicationController

	def index
		@task = Task.all
		render :index
	end 

	def new
		@npo = Npo.find(params[:npo_id])
		@task = Task.new
		render :new
	end

	def create
		@npo = Npo.find(params[:npo_id])
		task = @npo.tasks.create(task_params)
		task.save
		redirect_to npo_path(@npo)		
	end

	def show 
		@task = Task.find(params[:id])
		render :show
	end

	def edit
		@task = Task.find(params[:id])
		if current_user.npos.tasks.include? @task
			render :edit
		else
			redirect_to login_path
		end

	end

	def update
	  task = Task.find(params[:id])
	  if user.is_npo.tasks.include? task
	    task.update_attributes(task_params)
	    redirect_to task_path(task)
	  else
	    redirect_to task_path
	  end
	end

	def destroy
		
	end

	private
	def task_params
		params.require(:task).permit(:issue, :description, :language, :framework)
		
	end

end



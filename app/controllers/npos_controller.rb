class NposController < ApplicationController
	def index 
		@npos = Npo.all
		render :show
	end

	def new
		@npo = Npo.new
		render :new
	end

	def create
		npo = current_user.npos.new(npo_params)
		if npo.save
			redirect_to npo_path(npo)
		else
			redirect_to root
		end
	end

	def show
		@npo = Npo.find(params[:id])
		render :show
	end

	private 
	def npo_params 
		params.require(:npo).permit(:name, :about, :created_at)
	end
end

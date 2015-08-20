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
			redirect_to root_path
		end
	end

	def show
		@npo = Npo.find(params[:id])
		render :show
	end

	def edit
		@npo = Npo.find(params[:id])
		render :edit
	end

  def update
    npo = Npo.find(params[:id])
    if current_user.npos.include? npo
        npo.update_attributes(npo_params)
        redirect_to npo_path(npo)
    else
      redirect_to signup_path
    end
  end

  def destroy
    npo = Npo.find(params[:id])
    if current_user.npos.include? npo
      npo.destroy
      redirect_to profile_path(current_user)
    else
      redirect_to login_path
    end
  end

	private 
	def npo_params 
		params.require(:npo).permit(:name, :about, :created_at, :avatar)
	end
end

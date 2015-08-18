class UsersController < ApplicationController

  def new
     if current_user
       redirect_to profile_path(current_user)
     else
      @user = User.new
     render :new
      end
  end

  def create
    if current_user 
      redirect_to profile_path(current_user)
    else 
      user=User.new(user_params)
      if user.save 
        session[:user_id] = user.id
        if user.is_npo
          redirect_to npoform_path 

        else
        redirect_to profile_path(current_user)
        end
      else 
      redirect_to signup_path

      end
    end
  end

  def show
    @user = User.find(params[:id])
    render :show

  end

  def edit
  end

  def update
  end
  private 
    def user_params 
      params.require(:user).permit(:username, :email, :password, :is_npo, :created_at)
    end

end

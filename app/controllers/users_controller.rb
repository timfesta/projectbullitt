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
    @user = User.find(current_user)
    render :edit
  end

  def update
    user = User.find(params[:id])
    if current_user
      # ill add these later (antonio)
      # flash[:notice] = "Successfully updated profile!"
      user.update_attributes(user_params)
      redirect_to profile_path(current_user)
    else
      flash[:error] = user.errors.full_messages.join(', ')
      redirect_to edit_profile_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user
      # flash[:error] = "Successfully deleted profile!"
      @user.destroy
      session[:user_id] = nil
      redirect_to root_path
    end
  end
  
  private 
    def user_params 
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :is_npo, :created_at, :avatar)
    end

    

end

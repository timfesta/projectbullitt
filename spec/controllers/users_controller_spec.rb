require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	before do
	      user_params = {}
      user_params[:is_npo] = FFaker::Boolean.maybe
   		# assert (is_npo == false || is_npo == true)
      user_params[:username] = FFaker::Lorem.words(2).join
      user_params[:email] = FFaker::Internet.email
      user_params[:password] = FFaker::Lorem.words(2).join
      user_params[:password_confirmation] = user_params[:password]
      @user = User.create(user_params)
	    end


        describe "GET #new" do
            it "should assign @user" do
              get :new
              expect(assigns(:user)).to be_instance_of(User)
            end

            it "should render the :new view" do
              get :new
              expect(response).to render_template(:new)
            end
        end

         describe "POST #create" do
      context "success" do
        it "should add new user to current_user" do
          users = @current_user.users
          post :create, user: {username: "blah", email: "blah", password: "blah"}
          expect(@current_user.users).to eq(users)
      end

          it "should redirect_to 'user_path' after successful create" do
                  post :create, user: {username: "blah", email: "blah", password: "blah"}
                  expect(response.status).to be(302)
                  expect(response.location).to match(/\/users\/\d+/)
end
end
          context "failure" do
                  it "should redirect to 'new_user_path' when create fails" do
                    # create blank user (assumes validations are set up in user model for presence of title and content)
                    post :create, user: { username: nil, email: nil, password: nil}
                    expect(response).to redirect_to(new_user_path)
               end
        	end
    	end
	end

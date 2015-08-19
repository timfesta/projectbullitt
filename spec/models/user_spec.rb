  #
  # spec/models/user_spec.rb
  #
  require 'rails_helper'
  RSpec.describe User, type: :model do

    before do
      user_params[:is_npo] = FFaker::Boolean.is_npo
   		assert (is_npo == false || is_npo == true)
      user_params[:username] = FFaker::Name.username
      user_params[:email] = FFaker::Internet.email
      user_params[:password] = FFaker::Lorem.words(2).join
      user_params[:password_confirmation] = user_params[:password]
      @user = User.create(user_params)
    end

  end
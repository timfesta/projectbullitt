  #
  # spec/models/user_spec.rb
  #
  require 'rails_helper'
  RSpec.describe User, type: :model do

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

describe "ActiveRecord associations" do
  it { expect(@user.npos).to eq([])}

  end


  end
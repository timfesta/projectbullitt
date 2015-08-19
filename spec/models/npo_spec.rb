  require 'rails_helper'
  RSpec.describe Npo, type: :model do

    before do
      npo_params = {}
      npo_params[:name] = FFaker::Lorem.words(2).join
      npo_params[:about] = FFaker::Lorem.words(2).join
      @npo = Npo.create(npo_params)
    end

describe "ActiveRecord associations" do
  it { expect(@npo.tasks).to eq([])}

  end
  end



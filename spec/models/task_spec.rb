  require 'rails_helper'
  RSpec.describe Task, type: :model do

    before do
      task_params = {}
      task_params[:issue] = FFaker::Lorem.words(2).join
      task_params[:description] = FFaker::Lorem.words(2).join
      task_params[:language] = FFaker::Lorem.words(2).join
      task_params[:framework] = FFaker::Lorem.words(2).join
      @task = Task.create(task_params)
    end

describe "ActiveRecord associations" do
  it { expect(@task.projects).to eq([])}

  end
  end

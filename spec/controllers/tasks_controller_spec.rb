require 'rails_helper'

RSpec.describe TasksController, type: :controller do

    before do
      task_params = {}
      task_params[:issue] = FFaker::Lorem.words(2).join
      task_params[:description] = FFaker::Lorem.words(2).join
      task_params[:language] = FFaker::Lorem.words(2).join
      task_params[:framework] = FFaker::Lorem.words(2).join
      @task = Task.create(task_params)
    end


describe "GET #new" do
      it "should assign @task" do
        get :new
        expect(assigns(:task)).to be_instance_of(Task)
      end

      it "should render the :new view" do
        get :new
        expect(response).to render_template(:new)
      end
    end
end

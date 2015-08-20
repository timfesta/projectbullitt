class WelcomeController < ApplicationController
  def index
    @npo = Npo.all
    @task = Task.all   
    render :index
  end
  
  def show
  	render :show
  end
end

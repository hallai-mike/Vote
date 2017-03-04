class ResultsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @result = Result.new
    @result.user_id = current_user.id
    @result.issue_id = params[:issue_id]
    #@result.option_id =Option.find_by(option: params[:result].option_id).id
    @test = params[:result]
    @test2 = @test[:option_id]
    @test3 = Option.find_by(option: @test2)
    @result.option_id = @test3.id
    if @result.save
      flash[:success] = "Welcome"
    else
      flash[:success] = "ERROR"
    end
    redirect_to root_url
  end
end
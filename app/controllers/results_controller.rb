class ResultsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @result = Result.new
    @result.user_id = current_user.id

    @result.issue_id = params[:issue_id]
    @resultparam = params[:result]
    @option_name = @resultparam[:option_id]
    @option = Option.find_by(option: @option_name)
    @result.option_id = @option.id

    @result.issue_id = @resultparam[:issue_id]



    if @result.save
      flash[:success] = "Welcome"
    else
      flash[:success] = "ERROR"
    end
    redirect_to root_url
  end
end
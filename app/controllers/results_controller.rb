class ResultsController < ApplicationController
  
  def new
  end

  # Submit a vote
  def create
    # Create new result
    @result = Result.new
    # Set the result's user_id
    @result.user_id = current_user.id

    #@result.issue_id = params[:issue_id]

    # Find the issue and option chosen by the user
    @resultparam = params[:result]
    @option_name = @resultparam[:option_id]
    @option = Option.find_by(option: @option_name)

    # Set the result's issue_id and option_id
    @result.option_id = @option.id
    @result.issue_id = @resultparam[:issue_id]

    # Submit the vote
    if @result.save
      flash[:success] = "Welcome"
    else
      flash[:success] = "ERROR"
    end
    redirect_to root_url
  end
end
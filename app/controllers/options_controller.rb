class OptionsController < ApplicationController
  before_action :find_issue
  before_action :logged_in_admin, only: [:create, :destroy]

  def create
    @option = @issue.options.create(option_params)
    if @option.save
      redirect_to issue_path(@issue)
    else
      flash[:danger] = "There was a problem adding that option"
      redirect_to issue_path(@issue)
    end
  end

  def destroy
    @option = Option.find(params[:id])
    if(@option.present?)
      @option.destroy
    end
    redirect_to issue_path(@issue)
  end

  private

    # finds issue by the id in the database
    def find_issue
      @issue = Issue.find(params[:issue_id])
    end

    def option_params
      params.require(:option).permit(:option)
    end

    # makes sure logged in user is an admin
    def logged_in_admin
      redirect_to root_url unless current_user.admin?
    end

end

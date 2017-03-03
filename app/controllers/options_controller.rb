class OptionsController < ApplicationController
  before_action :find_issue

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

    def find_issue
      @issue = Issue.find(params[:issue_id])
    end

    def option_params
      params.require(:option).permit(:option)
    end

end

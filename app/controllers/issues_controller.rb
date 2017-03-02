class IssuesController < ApplicationController
  def show
    @issue = Issue.find(params[:id])
  end

  def edit
    @issue = Issue.find(params[:id])
  end
  
  def update
    @issue = Issue.find(params[:id])
    if @issue.update_attributes(issue_params)
      redirect_to @issue
    else
      render 'edit'
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    if(@issue.present?)
      @issue.destroy
    end
    redirect_to root_url
  end

  private

    def issue_params
      params.require(:issue).permit(:title, :desc1, :desc2, :type)
    end

end

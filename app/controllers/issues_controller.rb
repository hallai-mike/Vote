class IssuesController < ApplicationController
  before_action :logged_in_admin, only: [:create, :edit, :destroy]

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to @issue
    else
      redirect_to root_url
    end
  end

  def show
    @issue = Issue.find(params[:id])
    @option = @issue.options.paginate(page: params[:page])
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

    # makes sure logged in user is an admin
    def logged_in_admin
      redirect_to root_url unless current_user.admin?
    end

end

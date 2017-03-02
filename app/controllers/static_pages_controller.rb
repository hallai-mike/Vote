class StaticPagesController < ApplicationController
  def home
    if logged_in? && current_user.admin?
      @issue = Issue.new
      @issues = Issue.paginate(page: params[:page])
    end
        
  end

  def help
  end
end

class StaticPagesController < ApplicationController
  def home
    if logged_in? 
      if current_user.admin?
        @issue = Issue.new
        @issues = Issue.paginate(page: params[:page])
      else
        @ballot = Issue.paginate(page: params[:page])
        @options = Option.paginate(page: params[:page])
      end
    end 
  end

  def results
    if logged_in? && current_user.admin?
      @results = Result.paginate(page: params[:page])
    end
  end

  def help
  end
end

class StaticPagesController < ApplicationController
  def home
    if logged_in? 
      if current_user.admin? # admin is logged in
        @issue = Issue.new
        @issues = Issue.paginate(page: params[:page])
      else # logged in user is not an admin
        @ballot = current_user.ballot.paginate(page: params[:page])
        @result = Result.new
        @options = Option.paginate(page: params[:page])
      end
    end 
  end

  def results
    # loads results when admin is logged in and on results page
    if logged_in? && current_user.admin?
      @results = Result.order(:issue_id, :option_id).paginate(page: params[:page])

      @summary = []
      issues = Issue.order(:created_at)
      issues.each { |issue|
        ar = []
        options = Option.where(issue_id: issue.id).order(:created_at)
        total = Result.where(issue_id: issue.id).count
        ar.push(issue.title)
        ar.push(["Total",total])
        options.each { |option|
          value = Result.where(issue_id: issue.id, option_id: option.id).count
          ar.push([option.option, value])
        }
        @summary.push(ar)
      }
    end
  end

  def help
  end
end

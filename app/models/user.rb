class User < ApplicationRecord
  has_many :results
	validates :username, presence: true, length: { maximum: 45 }, uniqueness: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

  def ballot
    #@ballot_all = Issue.paginate(page: params[:page])
    already_voted_issues = Result.where(user_id: id).pluck(:issue_id)
    if already_voted_issues.any?
      Issue.where("id NOT IN (?)", already_voted_issues)
    else
      Issue
    end
  end

end

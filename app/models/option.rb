class Option < ApplicationRecord
  belongs_to :issue
  validates :issue_id, presence: true
  validates :option, presence: true
end

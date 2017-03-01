class Issue < ApplicationRecord
  validates :title, presence: true, length: { maximum: 65 }, uniqueness: true
  validates :desc1, presence: true, length: { maximum: 150 }
end

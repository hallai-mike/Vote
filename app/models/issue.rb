class Issue < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :options, dependent: :destroy
  validates :title, presence: true, length: { maximum: 125 }, uniqueness: true
  validates :desc1, length: { maximum: 250 }
  validates :desc2, length: { maximum: 250 }
end

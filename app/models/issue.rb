class Issue < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :options, dependent: :destroy
  validates :title, presence: true, length: { maximum: 65 }, uniqueness: true
  validates :desc1, presence: true, length: { maximum: 150 }
end

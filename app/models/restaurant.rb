class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  def self.allowed_categories
    %W[chinese italian japanese french belgian]
  end
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: allowed_categories }
  validates :phone_number, presence: true, format: { with: /[\d]/ }

  def rating
    count = reviews.count
    'no ratings yet' if count.zero?
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end
    (sum / count.to_f).round(2)
  end
end

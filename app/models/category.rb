class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :icon, presence: true

  belongs_to :user
  has_and_belongs_to_many :deals

  def total_amount
    deals.sum('amount')
  end
end

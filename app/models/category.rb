class Category < ApplicationRecord
  validates :name, :icon, presence: true, length: { maximum: 100 }
  belongs_to :user
  belongs_to :deal
end

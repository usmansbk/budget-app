class Category < ApplicationRecord
  validates :name, :icon, presence: true, length: { maximum: 100 }

  belongs_to :user
  has_and_belongs_to_many :deals
end

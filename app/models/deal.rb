class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :name, :amount, presence: true, length: { maximum: 100 }
  validates :amount, numericality: { greater_than: 0 }
end

class Product < ApplicationRecord
  belongs_to :account

  # has_many :order_items

  has_many_attached :images

  has_many :comments

  validates :name, presence: true
  scope :latest, -> { order created_at: :desc }
end

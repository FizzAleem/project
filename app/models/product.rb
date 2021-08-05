class Product < ApplicationRecord
  belongs_to :account

  # has_many :order_items

  has_many_attached :images

  has_many :comments

  validates :name, :price, presence: true

  def to_s
    name
  end

  scope :latest, -> { order created_at: :desc }
end

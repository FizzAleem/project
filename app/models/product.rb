class Product < ApplicationRecord
  belongs_to :account
  has_many_attached :images
end

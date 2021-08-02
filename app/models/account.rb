class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_one_attached :avatar

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      'e-profile.png'
    end
  end
end

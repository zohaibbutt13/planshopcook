class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_picture, dependent: :destroy

  validates :profile_picture, content_type: [:png, :jpg, :jpeg]
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :full_name, presence: true

  # attribute methods start
  def user_full_name
    full_name
  end
  # attribute methods end
end

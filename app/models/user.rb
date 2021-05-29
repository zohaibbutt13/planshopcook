class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :full_name, presence: true

  has_many :recipes

  # attribute methods start
  def user_full_name
    full_name
  end
  # attribute methods end

  def is_admin?
    is_admin
  end
end

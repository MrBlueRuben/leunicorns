class User < ApplicationRecord
  has_many :unicorns, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

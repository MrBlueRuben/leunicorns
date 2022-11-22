class Booking < ApplicationRecord
  belongs_to :unicorn, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :date, uniqueness: true, presence: true
end

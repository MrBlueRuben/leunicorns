class Booking < ApplicationRecord
  belongs_to :unicorn
  belongs_to :user

  # validates :date, uniqueness: true, presence: true
end

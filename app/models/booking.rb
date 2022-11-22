class Booking < ApplicationRecord
  belongs_to :unicorn
  belongs_to :user
end

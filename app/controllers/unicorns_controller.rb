class UnicornController < ApplicationController
  belongs_to :user
  has_many :bookings

  def index
    @unicorns = Unicorn.all
  end
end

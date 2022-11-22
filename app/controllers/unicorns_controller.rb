class UnicornController < ApplicationController
  belongs_to :user
  has_many :bookings
  validates :name presence: true

  def index
    @unicorns = Unicorn.all
  end

  def new
    @unicorn = Unicorn.new
  end

  def create
    @unicorn = Unicorn.new(unicorn_params)

    if @unicorn.save
      redirect_to unicorn_path(@unicorn)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @unicorn.update(booking_params)
    redirect_to booking_path(@unicorn)
  end

  def destroy
    @unicorn.destroy
    redirect_to unicorn_path(@unicorn), notice: 'unicorn was successfully destroyed'
  end

  private

  def set_unicorn
    @unicorn = Unicorn.find(params[:id])
  end

  def unicorn_params
    params.require(:unicorn).permit(:name, :location, :spicies, :user_id)
  end
end

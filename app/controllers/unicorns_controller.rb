class UnicornsController < ApplicationController
  before_action :set_unicorn, only: %i[update show edit destroy]

  def index
    @unicorns = Unicorn.all
  end

  def new
    @unicorn = Unicorn.new
  end

  def show
    @unicorns = Unicorn.all
  end

  def create
    @unicorn = Unicorn.new(unicorn_params)
    @unicorn.user = current_user

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
    params.require(:unicorn).permit(:name, :description, :photo, :location, :price, :species, :user_id)
  end
end

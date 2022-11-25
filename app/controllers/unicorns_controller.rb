class UnicornsController < ApplicationController
  before_action :set_unicorn, only: %i[update show edit destroy]

  def index
    @unicorns = Unicorn.all

    if params[:query].present?
      # @unicorns = Unicorn.where("name ILIKE ?", "%#{params[:query]}%")
      sql_query = <<~SQL
      unicorns.name @@ :query
      OR unicorns.species @@ :query
      OR unicorns.location @@ :query
    SQL
      @unicorns = Unicorn.where(sql_query, query: "%#{params[:query]}%")
    else
      @unicorns = Unicorn.all
    end

    @markers = @unicorns.geocoded.map do |unicorn|
      {
        lat: unicorn.latitude,
        lng: unicorn.longitude,
        info_window: render_to_string(partial: "info_window", locals: {unicorn: unicorn})
      }
    end
  end

  def new
    @unicorn = Unicorn.new
  end

  def show
    @unicorns = Unicorn.all
    @markers = [@unicorn].map do |unicorn|
      {
        lat: unicorn.latitude,
        lng: unicorn.longitude,
        info_window: render_to_string(partial: "info_window", locals: {unicorn: unicorn})
      }
    end
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
    redirect_to unicorns_path, notice: 'unicorn was successfully destroyed'
  end

  private

  def set_unicorn
    @unicorn = Unicorn.find(params[:id])
  end

  def unicorn_params
    params.require(:unicorn).permit(:name, :description, :photo, :location, :price, :species, :user_id)
  end
end

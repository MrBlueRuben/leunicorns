class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @unicorns = Unicorn.all
  end

end

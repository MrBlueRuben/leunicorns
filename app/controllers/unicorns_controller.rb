class UnicornController < ApplicationController

  def index
    @unicorns = Unicorn.all
  end
end

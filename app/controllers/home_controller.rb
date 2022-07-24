class HomeController < ApplicationController
  def index
    @jnoodles = Jnoodle.all.order(id: "DESC")
  end
end

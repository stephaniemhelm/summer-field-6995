class MovieActorsController < ApplicationController
  def new
  end

  def create
    MovieActor.create(movie_id: params[:id], actor_id: params[:actor_id])
    require "pry"; binding.pry
    redirect_to "/movies/#{params[:id]}"
  end
end

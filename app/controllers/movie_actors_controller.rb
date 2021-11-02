class MovieActorsController < ApplicationController
  def new
  end

  def create
    MovieActor.create(movie_id: params[:id], actor_id: params[:actor_id])
    redirect_to "/movies/#{params[:id]}"
  end

  def show
    @costars = MovieActor.find_by(movie_id: params[:id], actor_id: params[:actor_id])
  end

end

class MoviesController < ApplicationController
  
  def new
    @movie = Movie.new
  end

  def index
    matching_movies = Movie.all
    @movies = matching_movies.order( created_at: :desc )

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html 
    end
  end

  def show
    @movie = Movie.find(params.fetch(:id))
    render "movies/show"
  end

  def create
    movie_attributes = params.require(:movie).permit(:title, :description)  # this line allows us to access the movie hash from the form
    @movie = Movie.new(movie_attributes)
    @movie.title = params.fetch(:movie).fetch(:title)
    @movie.description = params.fetch(:movie).fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully." 
    else
      render "movies/new"
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))
    render "movies/edit" 
  end

  def update
    movie_attributes = params.require(:movie).permit(:title, :description)
    the_id = params.fetch(:id)
    @movie = Movie.where( id: the_id ).first
    @movie.title = params.fetch(:movie).fetch(:title)
    @movie.description = params.fetch(:movie).fetch(:description)
    
    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie updated successfully."
    else
      redirect_to movies_url, alert: "Movie failed to update successfully." 
    end
  end

  def destroy
    the_id = params.fetch(:id)
    @movie = Movie.where( id: the_id ).first
    @movie.destroy
    redirect_to movies_url, notice: "Movie deleted successfully."
  end
end

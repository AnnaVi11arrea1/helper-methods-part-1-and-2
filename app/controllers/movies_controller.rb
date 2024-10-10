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
    @movie = Movie.new
    @movie.title = params.fetch(:title)
    @movie.description = params.fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully." 
    else
      render "movies/new"
    end
  end

  def edit
    the_id = params.fetch(:id)
    matching_movies = Movie.where( id: the_id )
    @movie = matching_movies.first
    render "movies/edit" 
  end

  def update
    the_id = params.fetch(:id)
    @movie = Movie.where( id: the_id ).first
    @movie.title = params.fetch("query_title")
    @movie.description = params.fetch("query_description")

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

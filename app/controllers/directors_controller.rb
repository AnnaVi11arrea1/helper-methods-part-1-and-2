class DirectorsController < ApplicationController
  def new
    @director = Director.new
  end

  def index
    matching_directors = Director.all
    @directors = matching_directors.order( :name => :asc )

    respond_to do |format|
      format.jason do
        render json: @directors
      end

      format.html
    end
  end

  def show
    @director = Director.find(params[:id])
    render "directors/show"
  end

  def create
    director_attributes = params.require(:director).permit(:name, :dob, :bio)
    @director = Director.new(director_attributes)
    @director.name = params.fetch(:director).fetch(:name)
    @director.dob = params.fetch(:director).fetch(:dob)
    @director.bio = params.fetch(:director).fetch(:bio)

    if @director.valid?
      @director.save
      redirect_to directors_url, notice: "Director created successfully."
    else
      render "directors/new"
    end
  end

  def edit
    @director = Director.find(params[:id])
    render "directors/edit"
  end

  def update
    director_attributes = params.require(:director).permit(:name, :dob, :bio)
    the_id = params.fetch(:id)
    @director = Director.where( id: the_id).first
    @director.name = params.fetch(:director).fetch(:name)
    @director.dob = params.fetch(:director).fetch(:dob)
    @director.bio = params.fetch(:director).fetch(:bio)

    if @director.valid?
      @director.save
      redirect_to directors_url, notice: "Director updated successfully."
    else
      redirect_to directors_url, alert: "Director failed to update successfully."
    end
  end

  def destroy
    the_id = params.fetch(:id)
    @director = Director.where( id: the_id ).first
    @director.destroy
    redirect_to directors_url, notice: "Director deleted successfully."
  end

end

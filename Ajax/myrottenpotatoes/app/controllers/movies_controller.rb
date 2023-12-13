class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID

    # Check if the request is an AJAX request
    if request.xhr?
      # If it's an AJAX request, render the 'movie' partial with the @movie object
      render(:partial => 'movie', :object => @movie)
    else
      # If it's a regular HTTP request, render the default show view
      # (will render app/views/movies/show.<extension> by default)
      render(:partial => 'show', :object => @movie)
    end
  end

  def new
    @movie = Movie.new
  end 

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} created."
    else
      flash[:alert] = "Movie could not be created: " +
                      @movie.errors.full_messages.join(",")
      render 'new'
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: "#{@movie.title} updated."
    else
      flash[:alert] = "#{@movie.title} could not be updated: " +
                      @movie.errors.full_messages.join(",")
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, notice: "#{@movie.title} deleted."
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :release_date)
  end
end


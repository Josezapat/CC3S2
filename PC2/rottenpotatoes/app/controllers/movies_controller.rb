class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
  
    def index
      @movies = Movie.all
    end
  
    def show
    end
  
    def new
      @movie = Movie.new
    end
  
    def create
      @movie = Movie.new(movie_params)
      if @movie.save
        redirect_to movie_path(@movie), notice: 'Película creada con éxito.'
      else
        render 'new'
      end
    end
  
    def edit
    end
  
    def update
      if @movie.update(movie_params)
        redirect_to movie_path(@movie), notice: 'Película actualizada con éxito.'
      else
        render 'edit'
      end
    end
  
    def destroy
      @movie.destroy
      redirect_to movies_path, notice: 'Película eliminada con éxito.'
    end
  
    private
  
    def set_movie
      @movie = Movie.find(params[:id])
    end
  
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
  end
  
class MoviesController < ApplicationController

    before_action :authorize, only: [:new, :create,:edit, :update, :destroy]
    before_action :find_movie, only: [:show, :edit, :update, :destroy]
    
    
    def index
        @movies = Movie.all
    end

    def new
        @movie = Movie.new
    end
    
    def create
        @movie = Movie.new(params_movie)

        @movie.save
        
        redirect_to movies_path
    end

    def show
    end

    def edit
    end

    def update
        @movie.update(params_movie)
        redirect_to movies_path
    end

    def destroy
        @movie.destroy
        redirect_to movies_path
    end

    private

    def params_movie
        params.require(:movie).permit(:title,:summary)
    end

    def find_movie
        @movie = Movie.find(params[:id])
    end
end
    
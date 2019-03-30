class MoviesController < ApplicationController
  
  def index
   
  end

  def search_movie
    title = params[:name] 
    year = params[:year]
    @result = Movie.find_film(title,year)

    puts "resultttttttttttttttttttttttt #{@result}"
    respond_to do |format|
      format.html { redirect_to search_result_movies_path(result: @result) }
    end
  end

  def search_result
    @result = params[:result]
  end

  private

    def movie_params
      params.fetch(:title,:year,:result)
    end
end

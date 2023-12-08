class MoviesController < ApplicationController
  def create
    
    #{"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director"=>"6"}

    m = Movie.new
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director")
    m.save

    redirect_to("/movies")

  end

  def destroy
    the_id = params.fetch("an_id")

    the_movie = Movie.where({:id => the_id}).at(0)
    
    the_movie.destroy

    redirect_to("/movies")
  end
  
  def update
    the_id = params.fetch("the_id")

    m = Movie.where({:id => the_id}).at(0)
    
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director")
    m.save

    redirect_to("/movies/#{the_id}")

  end


  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end

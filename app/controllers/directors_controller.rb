class DirectorsController < ApplicationController
  def create
    
    a = Director.new
    a.name = params.fetch("the_name")
    a.dob = params.fetch("the_dob")
    a.bio = params.fetch("the_bio")
    a.image = params.fetch("the_image")

    a.save

    redirect_to("/directors")

  end

  def destroy
    the_id = params.fetch("an_id")

    the_director = Director.where({:id => the_id}).at(0)
    
    the_director.destroy

    redirect_to("/directors")
  end

  def update
    the_id = params.fetch("the_id")

    a = Director.where({:id => the_id}).at(0)

    a.name = params.fetch("the_name")
    a.dob = params.fetch("the_dob")
    a.bio = params.fetch("the_bio")
    a.image = params.fetch("the_image")
    a.save
    
    redirect_to("/directors/#{the_id}")

  end 
  
  
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end
end

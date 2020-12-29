class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
  end

  def add
    @person = Person.new
    
  end

  def create
    @person = Person.new person_params
    if @person.save then
      redirect_to "/people/index"
    else
      render "/people/add"
    end
    #@person.save
    #redirect_to "/people/index"
  end

  def delete
    obj = Person.find(params[:id])
    obj.destroy
    redirect_to "/people/index"
  end

  def edit_profile
    @person = Person.find(params[:id])
  end

  def update
    obj = Person.find(params[:id])
    obj.update(person_params)
    redirect_to "/people/index"
  end

  private
  def person_params
    params.require(:person).permit(:name, :native_language, :language_to_study)
    #, :password, :self_introduction, :mother_tongue, :language_studie
  end
end

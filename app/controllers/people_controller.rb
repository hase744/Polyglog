class PeopleController < ApplicationController
  before_action :ensure_correct_person, {only:[:edit_profile, :update, :destroy]}
  before_action :who_is_current_person, {only:[:show]}
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
    @messages = Message.where(person:@person.name)
    gon.current_person_email = @ccurent_person.email
    gon.person_email = @person.email
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
    redirect_to "/people/#{params[:id]}"
    #File.binwrite("public/person_images/#{@person.name}",image.read)
  end

  def ensure_correct_person
    if current_person == nil
      redirect_to("/people/#{params[:id]}")
    else
      if params[:id].to_i == current_person.id
      else
       redirect_to("/people/index")
      end
    end
  end

  def who_is_current_person
    if current_person == nil
      @ccurent_person ="false"
    else
      @ccurent_person = current_person
    end
  end

  private
  def person_params
    params.require(:person).permit(:name, :native_language, :language_to_study, :self_introduction, :image)
    #, :password, :self_introduction, :mother_tongue, :language_studie
  end
end

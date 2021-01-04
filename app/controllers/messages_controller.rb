class MessagesController < ApplicationController
    before_action :ensure_correct_person, {only:[:add, :edit_profile, :update, :destroy, :destroy]}
    before_action :who_is_current_person, {only:[:show]}
    def index
        @messages = Message.all
    end

    def edit
    end

    def show
        @message = Message.find(params[:id])
        @correction = Correction.new
    end
    
    def add
        @message = Message.new
    end

    def create
        #@message.person = current_person.name
        #@message.language = current_person.language_to_study
        @message = Message.new(message_params)
        @message.language = current_person.language_to_study
        @message.person = current_person.name
        if @message.save then
            redirect_to "/messages/index"
          else
            render "/messages/add"
        end
    end

    def update
        obj = Message.find(params[:id])
        obj.update(message_params)
        redirect_to "/messages/#{params[:id]}"
    end

    def delete
        obj = Message.find(params[:id])
        obj.destroy
        redirect_to "/messages/index"
    end

    def ensure_correct_person
        if current_person == nil
          @current_person = 0
          redirect_to("/messages/index")
        else
        @current_person = current_person
          if params[:id].to_i == current_person.id || arams[:id].to_i == nil
          else
           redirect_to("/messages/index")
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
  def message_params
    params.require(:message).permit(:title, :content, :language, :person) 
    #=> {language: "English", person: hase744}
    #, :password, :self_introduction, :mother_tongue, :language_studie
  end
end

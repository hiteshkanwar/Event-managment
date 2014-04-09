 
class WelcomeController < ApplicationController

	before_filter :authenticate_user!, :except=>[:manager_reg,:create,:main,:create_event]
  respond_to :html, :js
  
  def index
     @person_id = Person.find_by_user_id(current_user.id)
     @eventin = Eventinfo.find_all_by_person_id(@person_id)
     @status = Eventinfo.where(:id =>params[:id]).update_all(:status => "1")
     @eventinfo = Eventinfo.find_all_by_manager_id(current_user.id)
  end

  def create_event
    @event=Event.new(params[:event])
    @event.save()
      params[:person_id].each do |id|
        @eventinfo=@event.eventinfos.new(:manager_id=>params[:event][:id],:client_id=>current_user.id,:person_id=>id,:status=>0)
        @eventinfo.save
      end    
    if @eventinfo.save
      redirect_to welcome_show_event_path	
    end
  end

  def show_event
   @eventinfo = Eventinfo.find_all_by_client_id(current_user.id)
  end  

  def manager_profile
  end

  def main
  end

  def content
    @content = current_user.content
    if @content.blank? && (!params[:title].blank? || !params[:description].blank?)
      @content = current_user.build_content(:title=>params[:title],:description=>params[:description])
      @content.save
    else
      if !params[:title].blank?
        @content.title = params[:title]
        @content.save
      end
      if !params[:description].blank?
        @content.description = params[:description]
        @content.save
      end
    end
    respond_to do |format|
      format.js
      format.html
    end
  end
 
end

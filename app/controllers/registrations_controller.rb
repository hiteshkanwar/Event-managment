class RegistrationsController < Devise::RegistrationsController
 
  def new
    super
  end

  def create
      @user=User.new(params[:user])
      if !Role.find_by_name(params[:role]).blank?
        @role = Role.find_by_name(params[:role])
        @user.user_roles.new(:role_id=>@role.id)
      else
        @user.roles.new(:name=>params[:role])
        #@user.user_roles.new()
      end
      if params[:role]=="Client"   
        @clienr=@user.clients.new(:first_name=>params[:first_name],:last_name=>params[:last_name],:description=>params[:description])   
      elsif params[:role]=="Manager"
        @manager=@user.managers.new(:first_name=>params[:first_name],:last_name=>params[:last_name],:description=>params[:description])
      elsif params[:role]=="Person"
        @person=@user.persons.new(:first_name=>params[:first_name],:last_name=>params[:last_name])
      end
      if @user.save
        sign_in_and_redirect(@user)
      else
        super    
      end
  end
end

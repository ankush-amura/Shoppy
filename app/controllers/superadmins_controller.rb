class SuperadminsController < ApplicationController
  before_action :authenticate_user!
  def new
  @moderators= User.where(role:"Moderator",superadmin_id:nil)
  end

  def edit
  end

def delmod
   @moderators=current_user.moderators
   if(params[:id])
   @moderator=User.find(params[:id])
   @moderator.delete
   redirect_to controller: "superadmins" ,action:"delmod"
 end

end
  # this page renders the moderators under that superadmin
  def index
     #displays session variable onto the console
     puts session[:current_user_id]
     # here we get the superadmin of the particular id
     @superadmin=current_user
     # we get moderators that belongs to that superadmins
     @moderators= @superadmin.moderators
  end

def assign
  @moderator=User.find(params[:id])
  current_user.moderators.push(@moderator)
  redirect_to(controller: "superadmins",action: "index")
end
 # this function is responsible for creating a superadmin in the system
  def create
     # created new instance variable for superadmin class
  end
# this function is resposible for permitting the parameters that  should be included
# in mass assignment
  def superadmin_params
     params.require(:superadmin).permit(:name,:email,:contact,:password)
  end
end

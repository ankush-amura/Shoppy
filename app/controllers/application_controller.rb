class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) do |user_parts|
       user_parts.permit(:name,:email,:contact,:role,:password,:password_confirmation)
     end
   end

   def after_sign_in_path_for(resource)
       #  byebug

        if(current_user.role == "Superadmin")
          p current_user.role.to_s
            return  superadmins_path
        end

        if(current_user.role == "Moderator")
           return moderators_url
        end
        if(current_user.role == "Sale")
           return sales_url
        end
   end

end

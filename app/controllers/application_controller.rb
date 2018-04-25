class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters

        added_attrs = [:id_number, :gender, :mobile, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        update_attrs = [:password, :password_confirmation, :current_password]
        devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || dashboard_path
    end
end

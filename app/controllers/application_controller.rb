class ApplicationController < ActionController::Base

    before_action :current_user

    def current_user
        if session[:user]
            @user = (User.find(session[:user]["id"]) || User.new)
        else
            redirect_to '/'
        end
    end

    def logged_in?
        current_user.id != nil
    end

    def require_logged_in
        return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
    end
end

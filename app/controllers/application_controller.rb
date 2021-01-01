class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource) 
        "/messages/index"
    end

    def after_sign_out_path_for(resource)
        "/messages/index"
    end
    
end

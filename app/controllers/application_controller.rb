class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        teacher_clock_events_path(@teacher)
    end
    
    def after_sign_out_path_for(resource)
        root_path
    end
end

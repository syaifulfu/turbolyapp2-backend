class ApplicationController < ActionController::API

    def index
        render json: {
            'app': 'BACKEND TURBOLYAPP2',
            'users': User.all
        }
    end
    
end

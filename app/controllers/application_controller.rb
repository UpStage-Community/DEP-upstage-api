class ApplicationController < ActionController::API
    include Authenticable
    
    respond_to :json
    
end

module Authenticable
    # Devise methods overwrites
    def current_user
        @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
    end

    def authenticate_with_token!
        auth_token = request.headers['Authorization']

        if auth_token
            authenticate_with_auth_token auth_token
        else
            authentication_error
        end
    end

    private

    def authenticate_with_auth_token auth_token 
        unless auth_token.include?(':')
            authentication_error
            return
        end

        user_id = auth_token.split(':').first
        user = User.find_by(id: user_id)

        if user && Devise.secure_compare(user.auth_token, auth_token)
            # User can access
            sign_in user, store: false
        else
            authentication_error
        end
    end

    ## 
    # Authentication Failure
    # Renders a 401 error
    def authentication_error
        # User's token is either invalid or not in the right format
        render json: {errors: "Not authenticated" }, status: 401  # Authentication timeout
    end
end


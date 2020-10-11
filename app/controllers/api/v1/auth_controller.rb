class Api::V1::AuthController < ApplicationController

    def create 
        # byebug
        user = User.find_by(username: params['username'])
        
        if user && user.authenticate(params['password'])
            payload = {user_id: user.id}
            token = encode(payload)
            render json: {
                user_data: user.as_json({:except => [:password_digest], :include => [:dmv_paperworks]}),
                token: token
            }
            # render json: {message: "log in", user_data: user, error: false} #user_dmv_paperwork: user.dmv_paperworks}
        else
            render json: {
                message: 'Incorrect username or password',
                error: true
            }
        end
    end

    def token_log_in
        token = decode(request.headers['Authentication'])
        user_id = token['user_id']
        user = User.find(user_id)
        render json: user.as_json(:except => [:password_digest], :include => [:dmv_paperworks])
    end

end
class Api::V1::UsersController < ApplicationController

    def index
        render json: User.all.as_json(:except => [:password_digest], :include => [:dmv_paperworks])
    end

    def getpaperworks
        render json: User.find(params[:id]).as_json(:except => [:password_digest], :include => [:dmv_paperworks])
    end

    def update
        user = User.find(params[:id])
        user.update(has_permit: params['has_permit'])
        if user
            render json: user.as_json(:except => [:password_digest], :include => [:dmv_paperworks]) 
        else
            render json: {
                message: 'Incorrect username or password',
                error: true
            }
        end
    end


end
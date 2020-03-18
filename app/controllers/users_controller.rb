class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def show
        user = User.find_by(id: params[:id])

        if user 
            render json: user
        else
            render json: {error: 'No User Found'}
        end
    end

    def new
    end

    def create
        user = User.new(username: params[:user][:username], password: params[:password])

        if user.valid?
            user.save
            render json: user 
        else
            byebug
            render json: {error: 'invalid user parameters'}
        end
    end

    def edit
    end

    def update
    end

    private

    def strong_params(*args)
        params.require(:user).permit(*args)
    end
end

# include strong params
# return feedback for CRUD functionalities if oject isn't found or other types of errors*****
# serializer gem: ActiveModelSerializer / FastJSONSerializer
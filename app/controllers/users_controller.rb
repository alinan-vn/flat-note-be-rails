class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def show
        user = User.find_by(id: params[:id])

        if user 
            render json: JSON.pretty_generate(UserSerializer.new(user).serializable_hash)
        else
            render json: {id: '', username: '', error: 'No User Found'}
        end
    end

    def new
    end

    def create
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
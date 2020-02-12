class UsersController < ApplicationController
    def index
        # users = User.all
        render json: User.all
    end

    def show
        user = User.find_by(id: params[:id])
        render json: JSON.pretty_generate(UserSerializer.new(user).serializable_hash)
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
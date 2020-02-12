class NotesController < ApplicationController
    def index
        notes = Note.all
        render json: notes
    end

    def show
        note = Note.find_by(id: params[:id])
        render json: JSON.pretty_generate(NoteSerializer.new(note).serializable_hash)
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
        params.require(:note).permit(*args)
    end
end

# include strong params
# return feedback for CRUD functionalities if oject isn't found or other types of errors*****
# serializer gem: ActiveModelSerializer / FastJSONSerializer
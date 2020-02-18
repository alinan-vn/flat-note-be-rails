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
        note = Note.create(strong_params(:user_id, :title, :content, :tags))

        render json: JSON.pretty_generate(NoteSerializer.new(note).serializable_hash)
    end

    def edit
    end

    def update
        note = Note.find_by(id: params[:id])
        note.update(strong_params(:user_id, :title, :content, :tags))
    
        render json: JSON.pretty_generate(NoteSerializer.new(note).serializable_hash)
    end

    def destroy
        note = Note.delete(params[:id])

        render json: Note.all
    end

    private

    def strong_params(*args)
        params.require(:note).permit(*args)
    end
end
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
        # note = Note.create(strong_params(params[:user_id] so on))

        note = Note.create(
            user_id: 1, 
            title: params[:title],
            content: params[:content],
            tags: params[:tags]
        )

        render json: JSON.pretty_generate(NoteSerializer.new(note).serializable_hash)
    end

    def edit
    end

    def update
        note = Note.find_by(id: params[:id])
        note.update(
            user_id: 1, 
            title: params[:title],
            content: params[:content],
            tags: params[:tags]
        )

        render json: JSON.pretty_generate(NoteSerializer.new(note).serializable_hash)
    end

    private

    def strong_params(*args)
        params.require(:note).permit(*args)
    end
end

# def create
#     artist = Artist.create(name: params['artistName']['name'])
#     genre = Genre.create(name: params['genreName']['name'])
#     connection = Connection.create(artist_id: artist.id, genre_id: genre.id)
    
#     render json: connection, include: [:artist, :genre]
# end

# include strong params
# return feedback for CRUD functionalities if oject isn't found or other types of errors*****
# serializer gem: ActiveModelSerializer / FastJSONSerializer
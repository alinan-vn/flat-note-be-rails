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
            user_id: params[:user_id], 
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
            user_id: params[:user_id], 
            title: params[:title],
            content: params[:content],
            tags: params[:tags]
        )

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

# def update
#     @song = Song.find_by(id: params[:id])
#     @song.assign_attributes(song_params(:title, :link, :artist_id, :genre_id))
#     if @song.valid?
#         @song.save
#         redirect_to song_path(@song)
#     else
#         render :edit
#     end
    
# end

# def destroy
#     @song = Song.delete(params[:id])
#     redirect_to songs_path
# end

# ------------------------------------

# def create
#     artist = Artist.create(name: params['artistName']['name'])
#     genre = Genre.create(name: params['genreName']['name'])
#     connection = Connection.create(artist_id: artist.id, genre_id: genre.id)
    
#     render json: connection, include: [:artist, :genre]
# end

# include strong params
# return feedback for CRUD functionalities if oject isn't found or other types of errors*****
# serializer gem: ActiveModelSerializer / FastJSONSerializer
class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :notes

  def notes
    obj = self.object.notes.map do |note|
      {
        title: note.title,
        content: note.content,
        tags: note.tags
      }  
    end
    # return JSON.pretty_generate(obj)
  end

end

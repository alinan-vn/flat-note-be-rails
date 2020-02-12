class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :tags, :user

  def user
    user_obj = {
      username: self.object.user.username
  }
  end
end

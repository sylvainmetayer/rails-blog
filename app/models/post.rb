class Post < ActiveRecord::Base
  belongs_to :user

  # @param [User] user
  def can_be_updated_or_deleted_by(user)
    puts 'Test Can be deleted'
    puts self.user
    puts user
    if self.user == nil
      return false
    end
    puts self.user.id === user.id
    puts 'END'
    self.user == user
  end
end

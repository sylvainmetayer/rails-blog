class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  # @param [User] user
  def can_be_updated_or_deleted_by(user)
    if self.user == nil
      return false
    end
    self.user == user
  end
end

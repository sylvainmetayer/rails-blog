class Post < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, AvatarUploader

  validates :title, presence: true
  validates :content, presence: true
  validates :publish_date, presence: true

  # @param [User] user
  def can_be_updated_or_deleted_by(user)
    if self.user == nil
      return false
    end
    self.user == user
  end
end

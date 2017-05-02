class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :text, presence: true

  mount_uploader :image, ImageUploader

  def message_time
    created_at.to_s(:default)
  end
end

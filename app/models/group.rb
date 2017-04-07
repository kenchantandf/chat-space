class Group < ApplicationRecord
has_many :messages
has_many :group_users
has_many :users, through: :group_users

accepts_nested_attributes_for :users

validates :name, presence: true

def last_message
  self.messages.present? ? self.messages.last.text : 'まだメッセージはありません。'
end
end

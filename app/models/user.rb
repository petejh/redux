class User < ActiveRecord::Base
  has_many :messages, foreign_key: "author_id"

  has_secure_password
  validates :login, presence: true, uniqueness: true
  
  def own_messages
    self.messages
  end
end

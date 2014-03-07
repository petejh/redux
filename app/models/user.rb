class User < ActiveRecord::Base
  has_many :messages, foreign_key: "author_id"

  validates :login, presence: true, uniqueness: true
  
  def own_messages
    self.messages
  end
end

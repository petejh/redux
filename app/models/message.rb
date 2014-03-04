class Message < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  
  validates_presence_of :text, :author
end

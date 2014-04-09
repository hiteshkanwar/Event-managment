class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name,:user_id
  has_many :eventinfos
  belongs_to :user
  belongs_to :client
end

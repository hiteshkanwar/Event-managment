class Manager < ActiveRecord::Base
  attr_accessible :description, :first_name, :last_name,:user_id

 belongs_to :user
 
 has_many :clients
 has_many :enveninfos, through: :clients

has_many :eventinfos


end

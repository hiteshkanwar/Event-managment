class Client < ActiveRecord::Base
  attr_accessible :description, :first_name, :last_name,:user_id

  belongs_to :user
  has_many :eventinfos
  has_many :persons





end

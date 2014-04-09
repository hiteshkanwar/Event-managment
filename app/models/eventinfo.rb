class Eventinfo < ActiveRecord::Base
  attr_accessible :client_id, :manager_id, :person_id, :event_id,:status
 belongs_to :manager
 belongs_to :client
 belongs_to :person
 belongs_to :event
end

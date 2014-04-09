class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name, :file
  has_many :eventinfos

    attr_accessible :file
   has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }
   # validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
    validates_attachment_content_type :file,
      :content_type => [ 'application/pdf' ],
      :message => "only pdf files are allowed"
end

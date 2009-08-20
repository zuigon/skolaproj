class Subject < ActiveRecord::Base
  belongs_to :student
  #has_many :marks
  validates_presence_of :name
  
  accepts_nested_attributes_for :student, :allow_destroy => true
  
end

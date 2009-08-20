class Student < ActiveRecord::Base
  has_many :subjects
  validates_presence_of :ime
  validates_presence_of :prezime
  
  
end

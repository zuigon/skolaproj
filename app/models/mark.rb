class Mark < ActiveRecord::Base
  # belongs_to :subject
  validates_presence_of :mark
  
  
end

class Student < ActiveRecord::Base
  has_many :subjects

  def self.find_all_by_odjel(odjel)
    self.find(:all, :conditions => ["odjel LIKE ?", odjel])
  end

end

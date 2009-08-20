class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.integer :student_id
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end

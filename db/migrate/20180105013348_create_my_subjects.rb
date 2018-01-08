class CreateMySubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :my_subjects do |t|
      t.string :name

      t.timestamps
    end
  end
end

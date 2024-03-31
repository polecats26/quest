class CreateFellowshipMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :fellowship_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fellowship, null: false, foreign_key: true
      t.timestamps
    end
  end
end

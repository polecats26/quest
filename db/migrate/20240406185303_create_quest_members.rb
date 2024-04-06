class CreateQuestMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :quest_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quest, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end

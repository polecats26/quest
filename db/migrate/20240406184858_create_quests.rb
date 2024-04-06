class CreateQuests < ActiveRecord::Migration[7.1]
  def change
    create_table :quests do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :user, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true
      t.string :image_url
      t.boolean :completed
      t.datetime :completion_date

      t.timestamps
    end
  end
end

class CreatePartyMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :party_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true
      t.timestamps
    end
  end
end

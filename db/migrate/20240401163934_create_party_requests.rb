class CreatePartyRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :party_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true
      t.boolean :accepted
      t.text :description

      t.timestamps
    end
  end
end

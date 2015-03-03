class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :token
      t.belongs_to :user
      t.belongs_to :client
      t.timestamps null: false
    end
  end
end

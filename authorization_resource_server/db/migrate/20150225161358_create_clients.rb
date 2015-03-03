class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_id
      t.string :client_secret
      t.string :redirect_uri
      t.timestamps null: false
    end
  end
end

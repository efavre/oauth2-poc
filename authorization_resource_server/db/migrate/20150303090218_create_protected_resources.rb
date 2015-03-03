class CreateProtectedResources < ActiveRecord::Migration
  def change
    create_table :protected_resources do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

class CreateClientManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :client_managers do |t|
      t.string :name, limit: 50, nullable: false
      t.string :last_name, limit: 50, nullable: false
      t.string :mother_last_name, limit: 50, nullable: true
      t.boolean :status, nullable: false, default: true

      t.timestamps
    end
  end
end

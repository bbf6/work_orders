class CreateClientBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :client_branches do |t|
      t.references :client, null: false, foreign_key: true
      t.references :client_manager, null: false, foreign_key: true
      t.string :address, nullable: false, limit: 1000
      t.string :email, nullable: true, limit: 50
      t.boolean :status, nullable: false, default: true

      t.timestamps
    end
  end
end

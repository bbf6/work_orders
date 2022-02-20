class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, limit: 200, nullable: false
      t.boolean :status, nullable: false, default: true

      t.timestamps
    end
  end
end

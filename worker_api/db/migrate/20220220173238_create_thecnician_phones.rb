class CreateThecnicianPhones < ActiveRecord::Migration[7.0]
  def change
    create_table :thecnician_phones do |t|
      t.references :thecnician, null: false, foreign_key: true
      t.string :description, nullable: true, limit: 50
      t.string :number, nullable: false, limit: 20
      t.boolean :status, nullable: false, default: true

      t.timestamps
    end
  end
end

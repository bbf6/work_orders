class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.datetime :accident_date, nullable: false
      t.string :details, nullable: false, limit: 8000
      t.references :work_order, null: true, foreign_key: true
      t.references :client_branch, null: false, foreign_key: true
      t.boolean :status, nullable: false, default: true

      t.timestamps
    end
  end
end

class CreateWorkOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :work_orders do |t|
      t.references :thecnician, null: true, foreign_key: true
      t.datetime :begining_attention_date, nullable: false
      t.datetime :ending_attention_date, nullable: false
      t.integer :status, null: false, default: 1, inclusion: 1..5

      t.timestamps
    end
  end
end

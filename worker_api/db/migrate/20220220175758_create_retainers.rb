class CreateRetainers < ActiveRecord::Migration[7.0]
  def change
    create_table :retainers do |t|
      t.datetime :service_date, nullable: false
      t.references :work_order, null: true, foreign_key: true
      t.references :client_branch, null: false, foreign_key: true
      t.boolean :status, nullbale: false, default: true

      t.timestamps
    end
  end
end

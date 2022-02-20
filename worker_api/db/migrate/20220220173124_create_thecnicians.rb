class CreateThecnicians < ActiveRecord::Migration[7.0]
  def change
    create_table :thecnicians do |t|
      t.string :name, nullable: false, limit: 50
      t.string :last_name, nullable: false, limit: 50
      t.string :mother_last_name, nullable: true, limit: 50
      t.date :birth_date, nullable: false
      t.boolean :sex, nullable: false
      t.string :email, nullable: true
      t.binary :pic, nullable: true
      t.boolean :status, nullable: false, default: true

      t.timestamps
    end
  end
end

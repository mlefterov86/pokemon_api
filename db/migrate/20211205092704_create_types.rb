class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string :name
      t.string :url

      t.timestamps

      t.index [:name], unique: true
    end
  end
end

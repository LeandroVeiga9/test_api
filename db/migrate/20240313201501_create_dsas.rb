class CreateDsas < ActiveRecord::Migration[6.1]
  def change
    create_table :dsas do |t|
      t.string :name

      t.timestamps
    end
  end
end

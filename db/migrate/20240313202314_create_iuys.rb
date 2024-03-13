class CreateIuys < ActiveRecord::Migration[6.1]
  def change
    create_table :iuys do |t|
      t.string :name

      t.timestamps
    end
  end
end

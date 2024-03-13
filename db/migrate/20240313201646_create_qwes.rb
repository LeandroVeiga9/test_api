class CreateQwes < ActiveRecord::Migration[6.1]
  def change
    create_table :qwes do |t|
      t.string :name

      t.timestamps
    end
  end
end

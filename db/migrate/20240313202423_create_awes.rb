class CreateAwes < ActiveRecord::Migration[6.1]
  def change
    create_table :awes do |t|
      t.string :name

      t.timestamps
    end
  end
end

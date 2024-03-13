class CreateIus < ActiveRecord::Migration[6.1]
  def change
    create_table :ius do |t|
      t.string :name

      t.timestamps
    end
  end
end

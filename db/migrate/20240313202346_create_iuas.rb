class CreateIuas < ActiveRecord::Migration[6.1]
  def change
    create_table :iuas do |t|
      t.string :name

      t.timestamps
    end
  end
end

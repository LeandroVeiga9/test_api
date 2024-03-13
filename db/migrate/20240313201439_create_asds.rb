class CreateAsds < ActiveRecord::Migration[6.1]
  def change
    create_table :asds do |t|
      t.rogerio :name

      t.timestamps
    end
  end
end

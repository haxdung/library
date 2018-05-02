class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string      :name
      t.string      :description
      t.references  :category, index: true
      t.integer  :author_id, foreign_key: true , index: true
      t.integer :average_point

      t.timestamps
    end
  end
end

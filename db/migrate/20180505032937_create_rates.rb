class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.references  :user, index: true
      t.references  :book, index: true
      t.integer :point

      t.timestamps
    end
  end
end

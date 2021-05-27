class CreateContributions < ActiveRecord::Migration[6.1]
  def change
    create_table :contributions do |t|
      t.string :name
      t.integer :amount
      t.references :author, index: true

      t.timestamps
    end
    add_foreign_key :contributions, :users, column: :author_id
  end
end

# frozen_string_literal: true

class Groups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :author_id
      t.timestamps
    end
  end
end

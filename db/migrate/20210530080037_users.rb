# frozen_string_literal: true

class Users < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username

      t.timestamps
    end
  end
end

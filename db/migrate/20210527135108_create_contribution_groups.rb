class CreateContributionGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :contribution_groups do |t|
      t.references :contribution, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end

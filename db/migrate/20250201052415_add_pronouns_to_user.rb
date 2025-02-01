class AddPronounsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :pronouns, :string
  end
end

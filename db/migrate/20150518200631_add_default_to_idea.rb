class AddDefaultToIdea < ActiveRecord::Migration
  def change
    remove_column :ideas, :quality, :integer
    add_column :ideas, :quality, :integer, default: 0
  end
end

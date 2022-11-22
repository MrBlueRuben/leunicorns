class AddColumnToUnicorns < ActiveRecord::Migration[7.0]
  def change
    add_column :unicorns, :description, :text
  end
end

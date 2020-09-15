class AddFieldsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :location, :string
    add_column :events, :description, :text
  end
end

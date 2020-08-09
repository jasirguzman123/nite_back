class AddMainCategoryToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :main_category, :integer, default: 0
  end
end

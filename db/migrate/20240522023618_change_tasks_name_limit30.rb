class ChangeTasksNameLimit30 < ActiveRecord::Migration[7.1]
  def change
    reversible do |dir|
      dir.up do
        change_column :tasks, :name, :string, limit: 30
      end
    end
  end
end

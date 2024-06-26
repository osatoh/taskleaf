class AddUserIdToTasks < ActiveRecord::Migration[7.1]
  def change
    reversible do |dir|
      dir.up do
        execute 'DELETE FROM tasks;'
        add_reference :tasks, :user, null: false, index: true
      end

      dir.down do
        remove_reference :tasks, :user, index: true
      end
    end

    up do
      execute 'DELETE FROM tasks;'
      add_reference :tasks, :user, null: false, index: true
    end

    down do
      remove_reference :tasks, :user, index: true
    end
  end
end

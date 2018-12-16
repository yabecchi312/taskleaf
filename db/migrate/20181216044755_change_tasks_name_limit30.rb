class ChangeTasksNameLimit30 < ActiveRecord::Migration[5.2]
  def change
    def up
      chage_column :tasks, :string, limit: 30
    end
    def down
      chage_column :tasks, :name, :string
    end
  end
end

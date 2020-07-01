class CreaetTasks < ActiveRecord::Migration[5.2]
  def change
    t.string :yarukoto
    t.string :rink
    t.text :comment
    t.string :image
  end
end

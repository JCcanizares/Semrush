class AddDayToSemrushStat < ActiveRecord::Migration
  def change
    add_column :semrush_stats, :day, :date
  end
end

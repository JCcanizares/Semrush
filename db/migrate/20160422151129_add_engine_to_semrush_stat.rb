class AddEngineToSemrushStat < ActiveRecord::Migration
  def change
    add_column :semrush_stats, :engine, :string
  end
end

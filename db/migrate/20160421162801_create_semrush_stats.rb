class CreateSemrushStats < ActiveRecord::Migration
  def change
    create_table :semrush_stats do |t|
      t.string :domain
      t.string :keyword
      t.integer :position
      t.integer :position_difference
      t.float :traffic_percent
      t.float :costs_percent
      t.integer :results
      t.float :cpc
      t.integer :volume
      t.string :url
      t.timestamps null: false
    end
  end
end

class HomeController < ApplicationController
  def index
    @semrush_data = SemrushStat.all
    @range_1 = SemrushStat.where("position >= 1 AND position <= 3")
    @range_2 = SemrushStat.where("position >= 4 AND position <= 10")
    @range_3 = SemrushStat.where("position >= 11 AND position <= 20")
    @range_4 = SemrushStat.where("position >= 21 AND position <= 50")
    @range_5 = SemrushStat.where("position >= 51")
  end
end

class HomeController < ApplicationController
  def index
    @semrush_data_us = SemrushStat.where(engine: 'us', day: Date.today).order('volume desc')
    @range_1 = @semrush_data_us.where('position >= 1 AND position <= 3')
    @range_2 = @semrush_data_us.where('position >= 4 AND position <= 10')
    @range_3 = @semrush_data_us.where('position >= 11 AND position <= 20')
    @range_4 = @semrush_data_us.where('position >= 21 AND position <= 50')
    @range_5 = @semrush_data_us.where('position >= 51')
    
    # Data for chart
    start_date = Date.today - 1.months
    end_date = Date.today
    
    @chart_traffic_day_keyword_data = []
     @chart_traffic_day_keyword_data << ['Date', 'Percent']
    start_date.upto(end_date) do |date|
      day_data = SemrushStat.where(engine: 'us', day: date)
      @chart_traffic_day_keyword_data << [date, (day_data.sum(:traffic_percent) / day_data.size)]
    end
    
  end
end

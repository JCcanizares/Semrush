class HomeController < ApplicationController
  def index
    # @semrush_data_us = SemrushStat.where(engine: 'us', day: Date.today).order('volume desc')
    @semrush_data_us = SemrushStat.where(engine: 'us', day: '2016-04-22').order('volume desc')
    @range_1 = @semrush_data_us.where('position >= 1 AND position <= 3').order('position asc')
    @range_1_keywords = @range_1.map(&:keyword)

    
    @range_2 = @semrush_data_us.where('position >= 4 AND position <= 10')
    @range_2_keywords = @range_2.map(&:keyword)

    
    @range_3 = @semrush_data_us.where('position >= 11 AND position <= 20')
    @range_3_keywords = @range_3.map(&:keyword)

    @range_4 = @semrush_data_us.where('position >= 21 AND position <= 50')
    @range_4_keywords = @range_4.map(&:keyword)
    
    @range_5 = @semrush_data_us.where('position >= 51')
    @range_5_keywords = @range_5.map(&:keyword)
    
    # Data for chart
    start_date = Date.today - 1.months
    end_date = Date.parse('2016-04-22')
    # end_date = Date.today
    
    @chart_traffic_day_keyword_data = []
    start_date.upto(end_date) do |date|
      day_data = SemrushStat.where(engine: 'us', day: date)
      @chart_traffic_day_keyword_data << [date.strftime('%D'), ((day_data.sum(:traffic_percent) / day_data.size)*100)]
    end
    
    @actual_top_keywords_traffic = []
    # data_traffic_desc = SemrushStat.where(engine: 'us', day: Date.today).order('traffic_percent desc').limit(10)
    data_traffic_desc = SemrushStat.where(engine: 'us', day: '2016-03-01').order('traffic_percent desc').limit(10)
    data_traffic_desc.each do |d|
      @actual_top_keywords_traffic << [d.keyword, d.traffic_percent]
    end
    
    @top_volume_keywords = []
    @semrush_data_us.take(20).each do |d|
      @top_volume_keywords << [d.volume, d.position, d.traffic_percent]
    end
    
  end
end

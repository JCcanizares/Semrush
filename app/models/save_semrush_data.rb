class SaveSemrushData
  def self.save_data
    report = Semrush::Report.domain("embarkrecruitment.co.uk")
    start_date = Date.today.beginning_of_month - 6.months
    end_date = Date.today
    
    start_date.upto(end_date) do |date|
      organic_report = report.organic(limit:100, display_date: date.strftime("%Y%m%d"))
      organic_report.each do |o|
        SemrushStat.create(
          domain: "embarkrecruitment.co.uk",
          keyword: o[:keyword],
          position: o[:pos],
          position_difference: o[:position_difference],
          traffic_percent: o[:traffic_percent],
          costs_percent: o[:costs_percent],
          results: o[:number_of_results],
          cpc: o[:cpc],
          volume: o[:average_vol],
          url: o[:url],
          day: date
        )
      end
    end
   
  end
end
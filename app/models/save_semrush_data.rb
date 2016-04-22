class SaveSemrushData
  def self.save_data
    report = Semrush::Report.domain('volcanic.co.uk')
    engines = ['us','uk']
    start_date = Date.today.beginning_of_month - 1.months
    end_date = Date.today
    
    engines.each do |e|
      start_date.upto(end_date) do |date|
        organic_report = report.organic(limit: 300, db: e, display_date: date.strftime('%Y%m%%d'), display_sort: 'nq_desc')
        organic_report.each do |o|
          SemrushStat.create(
            domain: "volcanic.co.uk",
            keyword: o[:keyword],
            position: o[:pos],
            position_difference: o[:position_difference],
            traffic_percent: o[:traffic_percent],
            costs_percent: o[:costs_percent],
            results: o[:number_of_results],
            cpc: o[:cpc],
            volume: o[:average_vol],
            url: o[:url],
            engine: e,
            day: date
          )
        end
      end
    end
  end
end
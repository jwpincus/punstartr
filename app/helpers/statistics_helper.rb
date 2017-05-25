module StatisticsHelper

  def donations_by_date
    line_chart donations_by_date_charts_path, library: {
        title: {text: 'Donations by date', x: -20},
        yAxis: {
            crosshair: true,
            title: {
                text: 'Donations count'
            }
        },
        xAxis: {
            crosshair: true,
            title: {
                text: 'Date'
            }
        }
    }
  end
end

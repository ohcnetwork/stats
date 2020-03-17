class ApiController < ApplicationController
  def reports
    reports = District.includes(:reports).all.map do |d|
      report = d.reports.last
      {
        "#{d.name}": report_data(report)
      }
    end
    render json: { kerala: reports }
  end

  private

  def report_data(report)
    {
      under_observation: report.under_observation,
      under_home_isolation: report.under_home_isolation,
      total_hospitalised: report.total_hospitalised,
      hospitalised_today: report.hospitalised_today,
      corona_positive: report.corona_positive,
      cured_discharged: report.cured_discharged,
      deaths: report.deaths
    }
  end
end

class ApiController < ApplicationController
  def reports
    reports = District.includes(:reports).all.map do |d|
      report = d.reports.last
      {
        district_id: d.id,
        district_name: d.name,
        under_observation: report.under_observation,
        under_home_isolation: report.under_home_isolation,
        total_hospitalised: report.total_hospitalised,
        hospitalised_today: report.hospitalised_today,
        corona_positive: report.corona_positive,
        cured_discharged: report.cured_discharged,
        deaths: report.deaths
      }
    end
    render json: reports
  end
end

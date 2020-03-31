class ApiController < ApplicationController
  def reports
    reports = District.includes(:reports).all.each_with_object({}) do |d, obj|
      report = d.reports.order(:created_at).last
      obj[d.name] = report_data(report)
    end

    render json: { kerala: reports }
  end

  def kerala_summary
    reports = State.includes(:state_reports).all.each_with_object({}) do |s, obj|
      report = s.state_reports.order(:created_at).last
      obj[s.name] = report_data_state(report)
    end

    render json: { report: reports }
  end

  def all_stats
    districts = {}
    District.all.map { |d| districts[d.id] = d.name }
    reports = Report.all.each_with_object({}) do |r, obj|
      obj[districts[r.district_id]] = report_data(r)
    end

    render json: { reports: reports }
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

  def report_data_state(report)
    {
      under_observation: report.under_observation,
      under_home_isolation: report.under_home_isolation,
      total_hospitalised: report.total_hospitalised,
      hospitalised_today: report.hospitalised_today,
      corona_positive: report.corona_positive,
      cured_discharged: report.cured_discharged,
      deaths: report.deaths,
      number_samples_tested: report.number_samples_tested,
      number_of_negative_samples: report.number_of_negative_samples
    }
  end
end

module Api
  module V1
    class ReportsController < ApiController
      before_filter :require_oauth_application,:doorkeeper_authorize!
      respond_to :json

      def average_score_by_date
        je_report_query = current_resource_owner.journal_entries.eager_load(:journal_categories)
        je_report_query = je_report_query.where("timestamp >= ?", params[:start_date]) unless params[:start_date].blank?
        je_report_query = je_report_query.where("timestamp <= ?", params[:end_date]) unless params[:end_date].blank?
        je_report_query = je_report_query.where("journal_categories.name = ?", params[:category]) unless params[:category].blank?
        result = je_report_query.group("date(timestamp)").order("date_timestamp desc").average(:score)

        #Maps average from BigDecimal to float since BigDecimal is serialized as a string when converted to json.
        render json: result.map { |k, avg| { k => avg.to_f } }
      end
    end
  end
end

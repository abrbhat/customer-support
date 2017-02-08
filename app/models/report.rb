# This is a non-ORM class for generating report

class Report < ApplicationRecord

  # Generates a pdf file containing support requests closed within the last 1 month
  def self.generate
    # Fetch support requests closed within the last 1 month
    @support_requests = SupportRequest.where(status: 'closed')
                                      .where('closed_at >= ?', 1.month.ago)
                                      .sort

    # Render the report html as a string
    html = ApplicationController.render 'reports/show',
            assigns: { support_requests: @support_requests }

    # Convert the html into pdf using PDFKit
    @pdf = PDFKit.new(html).to_file("report.pdf")

    return @pdf
  end

  private
end

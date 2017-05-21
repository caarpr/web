class TableEventMailer < ApplicationMailer
  def contact_details(table_event, user)
    @table_event = table_event

    subject = "Contact details for #{table_event.starts_at.strftime("%-m/%-d")} #{table_event.table_location.name} table"

    mail(to: user.email, subject: subject)
  end
end


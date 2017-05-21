class TestMailer < ApplicationMailer
  def test(email)
    mail(to: email, subject: "cpac test #{Time.now.strftime("%Y%m%d%H%M%S")}")
  end
end

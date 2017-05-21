class ApplicationMailer < ActionMailer::Base
  default from: '"CPAC Tools" <no-reply@cpactools.org>'
  layout 'mailer'

  helper :application
end

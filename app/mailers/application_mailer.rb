class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@doc-robot.com"
  layout 'mailer'
end

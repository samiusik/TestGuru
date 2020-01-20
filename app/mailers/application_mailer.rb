class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <mail@TestGuru.com}
  layout 'mailer'
end

class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <testgurusamiusik@gmail.com>}
  layout 'mailer'
end

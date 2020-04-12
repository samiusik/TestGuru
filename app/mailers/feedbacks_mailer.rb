class FeedbacksMailer < ApplicationMailer
  default to: %{"TestGuru Admin" <testgurusamiusik@gmail.com>}

  def send_feedback(feedback)
    @name = feedback.name
    @email = feedback.email
    @phone_number = feedback.phone_number
    @message = feedback.message

    mail(from: @email)
  end
end
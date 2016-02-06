class Feedbackmailer < ApplicationMailer

  def notif(feedback)
  byebug
  mail(:to => feedback.email , :subject => "new feedback reciedved on IGC website." )
    @msg = feedback.message
  end

end

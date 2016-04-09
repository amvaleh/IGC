class Feedbackmailer < ApplicationMailer

  def notif(feedback)
    @msg = feedback.message
    @user = feedback.email
    @name = feedback.name
    @tele = feedback.telephone
    mail(:to => "info@igc-ir.com" , :subject => "new feedback reciedved on IGC website." )

  end

end

class Notification < ApplicationMailer


  def new_document(document)
    @greeting = "GENERAL NOTIFICATION"
    @document = document
    @users_to_notify = User.pluck(:email).join(', ')
    mail to: @users_to_notify , subject: "ROBOT SAYS: A new document has been added to the repository"
  end
end

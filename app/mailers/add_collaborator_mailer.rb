include Rails.application.routes.url_helpers

class AddCollaboratorMailer < ApplicationMailer
  def inform(contact, owner, project)
    @contact = contact
    @owner = owner
    @project = project
    mail(to: contact.email, subject: "#{owner.name} has invited you to join his project!")
  end
end

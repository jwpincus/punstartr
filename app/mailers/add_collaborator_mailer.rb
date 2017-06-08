class AddCollaboratorMailer < ApplicationMailer
  # include Rails.application.routes.url_helpers
  # include ActionView::Helpers::UrlHelper

  def inform(contact, owner, project)
    @contact = contact
    @owner = owner
    @project = project
    mail(to: contact.email, subject: "#{owner.name} has invited you to join his project!")
  end
end

class EmailJob < ApplicationJob
  queue_as :default

  def perform(user, current_user, project)
    AddCollaboratorMailer.inform(user, current_user, @project).deliver_now
    # Do something later
  end
end

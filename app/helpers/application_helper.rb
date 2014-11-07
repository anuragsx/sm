module ApplicationHelper
  def unread_messages
    return @unread_messages if defined?(@unread_messages)
    @unread_messages = current_user.unread_messages.count
  end
end

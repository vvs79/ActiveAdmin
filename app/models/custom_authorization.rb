class CustomAuthorization < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    puts ""
    case subject
    when Blog
      !(action == :read)
    when AllComment
      !(action == :create)
    else
      true
    end
  end
end

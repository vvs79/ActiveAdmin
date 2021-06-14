ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Stories" do
          ul do
            Blog.last(5).map do |blog|
              li link_to(blog.title.truncate(20), admin_story_path(blog))
            end
          end
        end
      end

      column do
        panel "Recent Comments" do
          ul do
            AllComment.last(5).map do |comment|
              li link_to(comment.title.truncate(20), admin_comment_path(comment))
            end
          end
        end
      end
    end
  end # content
end

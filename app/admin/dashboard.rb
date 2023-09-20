# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    
    columns do
      columns do
        panel "Hotels" do
          ul do
            Hotel.all.map do |hotel|
              li link_to(hotel.name, admin_hotel_path(hotel))
            end
          end
        end
      end 
    end

      columns do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end 
end

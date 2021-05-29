module ApplicationHelper
  def get_flash_icons(flash_type)
    { notice: "fa fa-check", error: "fa fa-times", alert: "fa fa-exclamation", notify: "fa fa-info" }[flash_type.to_sym]
  end
end

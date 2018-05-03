module ApplicationHelper
  def javascript_controller_name
    controller.class.name.gsub('Controller', '') + action_name.capitalize
  end
end

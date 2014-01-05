module ApplicationHelper
  def is_active?(controller)
    return params[:controller] == controller.underscore
  end 
end

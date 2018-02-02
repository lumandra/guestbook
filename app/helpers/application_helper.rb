module ApplicationHelper

  def body_controller
    params[:controller].split('/').push(params[:action]).join('_')
  end

end

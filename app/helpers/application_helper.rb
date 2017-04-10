module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-warning" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(opts = {})
     flash.each do |msg_type, message|
       if msg_type != 'submitted'
         concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
                concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
                concat message
               end)
       end
     end
     nil
   end
end

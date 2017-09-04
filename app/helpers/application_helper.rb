module ApplicationHelper
	def show_messages_flash(condition, attributes = {}, &block)
    unless condition
      attributes["class"] = "alert-dismissible alert alert-#{attributes[:class_name]}"
    end    
    content_tag("div", attributes, &block)
  end	
end

 
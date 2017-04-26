module ApplicationHelper

  def display_alerts(preference)
    if preference.errors.nil?
      "There are no known errors. Try refreshing the page and resubmitting your changes."
    else
      preference.errors.full_messages.join(", and ")
    end
  end
  
end

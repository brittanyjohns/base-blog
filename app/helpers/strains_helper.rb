module StrainsHelper
  def icon_for(name)
    icon = ""
    case name
    when "giggly"
      icon = "<i class='fa-regular fa-face-laugh-squint'></i>"
    when "happy"
      icon = "<i class='fa-regular fa-face-grin-wide'></i>"
    when "relaxed"
      icon = "<i class='fa-solid fa-couch'></i>"
    when "sleepy"
      icon = "<i class='fa-solid fa-bed'></i>"
    when "talkative"
      icon = "<i class='fa-regular fa-comments'></i>"
    when "tingly"
      icon = "<i class='fa-solid fa-star-of-life'></i>"
    when "uplifted"
      icon = "<i class='fa-solid fa-person-arrow-up-from-line'></i>"
    when "aroused"
      icon = "<i class='fa-regular fa-face-kiss-wink-heart'></i>"
    when "creative"
      icon = "<i class='fa-solid fa-palette'></i>"
    when "energetic"
      icon = "<i class='fa-solid fa-bolt'></i>"
    when "euphoric"
      icon = "<i class='fa-solid fa-person-rays'></i>"
    when "focused"
      icon = "<i class='fa-solid fa-bullseye'></i>"
    when "hungry"
      icon = "<i class='fa-solid fa-burger'></i>"
    else
      icon = name
    end
    icon.html_safe
  end
end

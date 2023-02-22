module ApplicationHelper
  def star_rating(average_score)
    rounded_score = average_score.to_i
    content = ""
    checked = "<span class='fa fa-star checked'></span>"
    unchecked = "<span class='fa fa-star'></span>"
    rating = checked * rounded_score
    empty_stars = 5 - rounded_score
    empty = unchecked * empty_stars
    content = rating + empty
    puts "CONTENT: #{content}"
    content.html_safe
  end
end

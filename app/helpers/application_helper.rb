module ApplicationHelper
  def set_title(title)
    content_for :title, strip_tags(title)
  end

  def page_heading(tag, heading)
    set_title heading
    content_tag tag, heading.html_safe
  end

  def precise_duration_in_words(seconds)
    return nil if seconds <= 0

    days = seconds / (60 * 60 * 24)
    seconds -= days * (60 * 60 * 24)

    hours = seconds / (60 * 60)
    seconds -= hours * (60 * 60)

    minutes = seconds / 60
    seconds -= minutes * 60

    time = {
      day: days,
      hour: hours,
      minute: minutes,
      second: seconds
    }

    time.each do |k,v|
      time.delete(k) if v == 0
    end

    time.map do |unit, count|
      pluralize(count, unit.to_s)
    end.join(", ")
  end
end

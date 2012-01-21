Comnspace.Views.Extensions ||= {}

Comnspace.Views.Extensions.Time =

  months: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

  time_str: (time) ->
    now = new Date()
    a_year_ago = new Date(now.getYear() - 1, now.getMonth(), now.getDate())
    if time > a_year_ago
      "#{@months[time.getMonth()]} #{time.getDate()}"
    else
      "#{time.getMonth() + 1}/#{time.getDate()}/#{time.getYear()}"
  
  long_time_str: (time_s) ->
    time = new Date(time_s)
    "#{@time_str(time)} (#{@time_ago_in_words(time)} ago)"

  time_ago_in_words: (from) ->
    @distance_of_time_in_words new Date().getTime(), from
    
  distance_of_time_in_words: (to, from) ->
    seconds_ago = ((to - from) / 1000)
    minutes_ago = Math.floor(seconds_ago / 60)
    return "less than a minute"  if minutes_ago is 0
    return "a minute"  if minutes_ago is 1
    return minutes_ago + " minutes"  if minutes_ago < 45
    return "about 1 hour"  if minutes_ago < 90
    hours_ago = Math.round(minutes_ago / 60)
    return "about " + hours_ago + " hours"  if minutes_ago < 1440
    return "1 day"  if minutes_ago < 2880
    days_ago = Math.round(minutes_ago / 1440)
    return days_ago + " days"  if minutes_ago < 43200
    return "about 1 month"  if minutes_ago < 86400
    months_ago = Math.round(minutes_ago / 43200)
    return months_ago + " months"  if minutes_ago < 525960
    return "about 1 year"  if minutes_ago < 1051920
    years_ago = Math.round(minutes_ago / 525960)
    "over " + years_ago + " years"
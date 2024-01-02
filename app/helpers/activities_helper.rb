module ActivitiesHelper
  def calculate_pace(hours, minutes, seconds, distance)
    total_seconds = (hours * 3600) + (minutes * 60) + seconds
    pace_seconds = total_seconds / distance
    pace_minutes = pace_seconds / 60
    pace_seconds %= 60
  
    "%02d:%02d/km" % [pace_minutes, pace_seconds]
  end
  def form_pace(pace)
    min = pace / 60
    pace %= 60

    format('%02d:%02d', min, pace)
  end
end

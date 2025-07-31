module ApplicationHelper
  def competition_type_badge_class(competition)
    case competition.competition_type
    when 'points' then 'bg-primary'
    when 'distance' then 'bg-success'
    when 'pace' then 'bg-info'
    when 'regularity' then 'bg-warning text-dark'
    else 'bg-secondary'
    end
  end

  def competition_status(competition)
    if competition.active?
      'Aktywny'
    elsif competition.upcoming?
      'Nadchodzący'
    else
      'Zakończony'
    end
  end

  def competition_status_badge_class(competition)
    if competition.active?
      'bg-success'
    elsif competition.upcoming?
      'bg-warning text-dark'
    else
      'bg-secondary'
    end
  end

  def team_badge_class(user)
    case user.team&.name
    when 'Zieloni' then 'bg-success'
    when 'Pomarańczowi' then 'bg-warning text-dark'
    when 'Niebiescy' then 'bg-primary'
    else 'bg-secondary'
    end
  end

  def team_name_to_badge_class(team_name)
    case team_name.downcase
    when 'zieloni' then 'bg-success'
    when 'pomarańczowi' then 'bg-warning text-dark'
    when 'niebiescy' then 'bg-primary'
    else 'bg-secondary'
    end
  end
end

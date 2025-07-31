module CompetitionsHelper
  def team_row_class(team_name)
    case team_name
    when "Zieloni"
      "table-success"
    when "Pomarańczowi"
      "table-warning"
    when "Niebiescy"
      "table-primary"
    else
      ""
    end
  end

  def team_badge_class(team_name)
    case team_name
    when "Zieloni"
      "bg-success"
    when "Pomarańczowi"
      "bg-warning"
    when "Niebiescy"
      "bg-primary"
    else
      "bg-secondary"
    end
  end

  def medal_class(position)
    case position
    when 0
      "bg-warning text-dark" # złoto
    when 1
      "bg-secondary" # srebro
    when 2
      "bg-dark" # brąz
    end
  end

  def competition_type_badge(type)
    case type
    when 'points'
      "bg-primary"
    when 'distance'
      "bg-success"
    when 'pace'
      "bg-info"
    when 'regularity'
      "bg-warning text-dark"
    else
      "bg-secondary"
    end
  end
end

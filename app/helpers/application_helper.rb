module ApplicationHelper
  def seasonal_background
    month = Time.current.month

    if month.between?(9, 12)
      "background-image: url(#{asset_path('background.png')});"
    elsif month.between?(1, 3)
      "background-image: url(#{asset_path('background_winter.png')});"
    end
  end
end

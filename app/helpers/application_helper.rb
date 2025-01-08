module ApplicationHelper
  def seasonal_background
    month = Time.current.month

    if month.between?(9, 11)
      "background-image: url(#{asset_path('background.png')});"
    else
      "background-image: url(#{asset_path('background_winter.png')});"
    end
  end
end

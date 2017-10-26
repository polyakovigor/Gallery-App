module ApplicationHelper
  def local_datetime(datetime)
    datetime.localtime.strftime('%H:%M:%S %d %B %Y')
  end
end

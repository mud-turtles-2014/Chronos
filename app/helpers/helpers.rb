helpers do 
  def timify(timestring)
    Chronic.parse(timestring)
  end

  def current_user
    @current_user ||= User.find(1)
  end
  
end

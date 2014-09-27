get '/user/:id' do
  Time.zone = "EST"
  @capsules = User.find(session[:user_id]).capsules
  p @capsules
  erb :pending
end



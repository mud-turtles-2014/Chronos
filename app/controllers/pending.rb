get '/user/:id' do
  p "IN THE ROUTE"
  @capsules = User.find(session[:user_id]).capsules
  p @capsules
  erb :pending
end



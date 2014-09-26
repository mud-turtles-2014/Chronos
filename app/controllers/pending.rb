get '/user/:id/pending' do
  p "IN THE ROUTE"
  @capsules = User.find(1).capsules
  erb :pending
end



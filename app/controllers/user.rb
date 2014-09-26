get '/user/:id' do

  erb :'user'
end

post '/user/:id/capsule' do
  params[:capsule]["next_time"] = timify(params[:capsule][:next_time])

  if params[:capsule]["next_time"] 
    current_user.capsules << Capsule.create(params[:capsule])
    redirect to ("/user/#{current_user.id}/pending")
  else
    session[:errors] = "Invalid Time."
    redirect to ("/user/#{current_user.id}")
  end 
end

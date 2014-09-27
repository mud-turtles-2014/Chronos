enable :sessions

before '/:username/landing_page' do
  @user = User.find_by(username: params[:username])
  session[:user_id] == @user.id ? @valid = true : @valid = false
end

get "/" do
  erb :index
end

get '/user/:id' do
  @viewables = current_user.capsules.where("next_time < ?", Time::now)
  erb :user
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

get '/user' do
  erb :'users/create_user'
end

post '/user' do
  user = User.new(params[:user])
  if user.valid?
    user.save
    redirect "/session"
  else
    redirect "/user"
  end
end

get '/session' do
  erb :'users/form'
end

post '/session' do
  user = User.authenticate(params[:username], params[:password])

  if user == nil || user == false
    session[:error] = "Login Failed"
    redirect "/session"
  else
    session[:user_id] = user.id
    # redirect "/user/#{user.id}"
    redirect "/user/#{current_user.id}"
  end
end

get "/user/:user_id" do
  erb :'/users/landing_page'
end

delete '/session' do
  session.clear
  erb :index
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/user/:user_id/profile' do
  erb :'/users/my_profile'
end


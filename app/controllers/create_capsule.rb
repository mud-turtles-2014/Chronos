get '/user/:user_id/capsule/new' do
  @user = current_user
  erb :create_capsule
end

post '/user/:user_id/capsule/new' do
  @user = User.find(session[:user_id])
  capsule = Capsule.new(params[:capsule])
  capsule.save
  redirect "/user/#{@user.id}"
end

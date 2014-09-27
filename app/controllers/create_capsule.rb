get '/user/:user_id/capsule/new' do
  @user = current_user
  erb :create_capsule
end

post '/user/:user_id/capsule/new' do
  @user = User.find(session[:user_id])
  # capsule = Capsule.new(params[:capsule])
  # capsule.user = @user # Line 11 substitutes for 8/9/10
  # capsule.save
  @user.capsules.create(params[:capsule])
  redirect "/user/#{@user.id}"
end

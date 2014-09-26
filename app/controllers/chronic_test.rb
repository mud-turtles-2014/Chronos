get "/chronic_test" do
  erb :chronic_test
end

post '/chronic' do
  session[:user_id] = 1 #Need to change this once user authentication is working
  @time = timify(params[:time])
  if @time
  Capsule.create(user_id: session[:user_id], title: params[:title], caption: params[:caption], url: params[:url], next_time: @time)
  redirect "/user/#{session[:user_id]}"
  else
    session[:errors] = "Your time is invalid"
    redirect '/chronic_test'
  end

end

get "/user/:id" do
	@user = User.find(params[:id])
	@capsules = @user.capsules # instance var bc must be retrievable from user/show
	erb :'user/show'
end






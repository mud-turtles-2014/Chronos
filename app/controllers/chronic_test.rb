get "/chronic_test" do
  erb :chronic_test
end

post '/chronic' do
  @time = timify(params[:time])
  if @time
  Capsule.create(user_id: params[:user_id], title: params[:title], caption: params[:caption], url: params[:url], next_time: @time)
  redirect "/user/#{session[:id]}"
  else
    session[:errors] = "Your time is invalid"
    redirect '/chronic_test'
  end

end



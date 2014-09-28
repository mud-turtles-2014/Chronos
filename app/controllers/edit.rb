get "/user/:user_id/capsule/:capsule_id/edit" do
  @user = User.find(params[:user_id])
  @capsule = Capsule.find(params[:capsule_id])
  erb :edit
end

put "/user/:user_id/capsule/:capsule_id/edit" do
  @user = User.find(session[:user_id])

  Capsule.update(params[:capsule_id], params[:capsule])#need to make it params[capsule_id] bc that's what's in the url

  redirect "/user/#{@user.id}" #what is in redirect, needs to be up at the top of put (@user)
end

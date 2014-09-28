get "/user/:user_id/capsule/:capsule_id/edit" do
  @user = User.find(params[:user_id])
  @capsule = Capsule.find(params[:capsule_id])
  erb :edit
end

put "/user/:user_id/capsule/:capsule_id/edit" do
  @user = User.find(session[:user_id])
  # @user.capsules.create(params[:capsule])
  @capsule = Capsule.find(params[:capsule_id])
  Capsule.update(capsule[:user_id], params[:next_time])
  # @user.capsules.update(params[:capsule])
  redirect "/user/#{@user.id}"
end

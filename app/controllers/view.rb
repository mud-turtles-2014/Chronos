get "/user/:user_id/capsule/:capsule_id" do
  @capsule = User.find(session[:user_id]).capsules.find(params[:capsule_id])
  erb :view
end

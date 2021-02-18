class UsersController < ApplicationController
  
  def login_form
    
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
    )
    
    if @user.save
      flash[:notice] = "登録完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
    
  def show
    @user = User.find_by(id: params[:id])
  end
    
  def edit
     @user = User.find_by(id: params[:id])
  end
  
  def update
     @user = User.find_by(id: params[:id])
     if @user.save
      flash[:notice] = "変更しました"
      redirect_to("users/#{@user.id}")
     else
      render("users/edit")
     end
  end
  
end

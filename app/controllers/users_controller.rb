class UsersController < ApplicationController   
   def profile
   	 @posts = current_user.posts
   end
end
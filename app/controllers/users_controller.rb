class UsersController < ApplicationController

  layout "users"

  before_filter :find_user, :only => [:show, :activate]

  def index
    #@users = User.all(:conditions => {:type => "User"})
    @users = User.all
  end

  def show
    @reviews_text = @user.reviews.inject("") do |memo, r|
      memo.concat("; ") if !memo.blank?
      memo + r.body
    end

    respond_to do |format|
      format.html { render :html => @user }
      format.xml  { render :xml => @user }
    end
  end

  # toggle user's active attribute
  def activate
    active = @user.active
    @user.update_attribute(:active, !active)

    respond_to do |format|
      format.html { redirect_to user_url(:id => params[:id]) }
      format.json { render :json => @user.to_json }
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
 end

end
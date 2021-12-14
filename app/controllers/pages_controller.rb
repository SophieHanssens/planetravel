class PagesController < ApplicationController
  def home

  end

  def about
    @user = current_user
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in? && current_user.profile.nil?
      redirect_to new_profile_path
    else
      redirect_to profiles_path
    end
  end
end

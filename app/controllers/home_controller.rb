class HomeController < ApplicationController
  def index
  end

  def sys
  end

  def prof
    redirect_to new_professor_session_path
  end
end

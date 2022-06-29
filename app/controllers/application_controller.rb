class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_out_path_for(_resources)
    root_path
  end

  def after_sign_up_path_for(_resources)
    new_user_session_path
  end
end

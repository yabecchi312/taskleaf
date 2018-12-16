class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  # ログインしている時のヘルパーメソッドを定義している。
  # セッションに問い合わせてuser_idを取得する

  def login_required
    redirect_to login_path unless current_user
  end
  #ユーザーがログイン済みかどうか確認するため
end

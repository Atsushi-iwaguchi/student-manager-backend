class Api::V1::SessionsController < ApplicationController
  #POST /api/v1/signin
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = generate_token(user)
      render json: {
        user: { id: user.id, email: user.email, name: user.name, role: user.role },
        token: token
      }
    else
      render json: { error: 'メールアドレスまたはパスワードが無効です' }, status: :unauthorized
    end
  end

  #トークンベースの認証ではサーバーサイドでのログアウト処理は不要
  #クライアントがトークンを破棄すればよい
  #必要に応じてトークンのブラックリスト化などを実装可能
  private
  def generate_token(user)
    payload = user.to_token_payload
    JWT.encode(payload, Rails.application.secret_key_base, 'HS256')
  end
end

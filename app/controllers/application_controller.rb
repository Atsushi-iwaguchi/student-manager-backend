class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods

    #今リクエストを送っているユーザーはだれかを返すメゾット
    def current_user
        #nilならauthenticate_tokenを読んで取得し、取得済みならキャッシュ値をそのまま使う
        @current_user ||= authenticate_token
    end

    def logged_in?
        #!!はnilでなければtrueを返す
        !!current_user
    end

    #before_action :authenticate_user! と書くことでログインしていないユーザーのアクセスをはじく
    def authenticate_user!
        render json: { error: '認証が必要です' }, status: :unauthorized unless logged_in?
    end

    private
    def authenticate_token
        #Authorizationヘッダーからトークンを自動取得するメゾット
        authenticate_with_http_token do |token, options|
            begin
                #JWT.decodeでトークンを検証, デコード
                decoded = JWT.decoded(
                    token,
                    Rails.application.credentials.secret_key_base,
                    true,
                    { algorithm: 'HS256' }
                )
                user_id = decoded[0]["sub"]
                User.find(user.id) #取り出したuser.idでDBからユーザーを検索しcurrent_userの返り値となる
              rescue JWT::DecodeError, JWT::ExpiredSignature, ActiveRecord::RecordNotFound
                nil
            end
        end
    end
end

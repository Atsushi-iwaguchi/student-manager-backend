class Api::V1::UsersController < ApplicationController
    def create
        @user = User.new(user_params)

        if @user.save
            token = generate_token(@user)
            render json: {
                user: { id: @user.id, email: @user.email, name: @user.name, role: @user.role },
                token: token
            }, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :name, :role, :target_school, :grade)
    end

    #user.to_token_payloadでペイロードを取得してJWT.encodeで秘密鍵を使って署名エンコードしてトークン文字列を生成
    def generate_token(user)
        payload = user.to_token_payload
        JWT.encode(payload, Rails.application.secret_key_base, 'HS256')
    end

end

class AuthenticateController < ApplicationController
    # before_action(:set_user, only: [])
    
    # 회원가입 페이지
    def sign_up
        @user = User.new
    end
    
    # 실제 회원가입 로직
    def user_sign_up
        @user = User.new(user_name: params[:user_name],
                        password: params[:password],
                        password_confirmation: params[:confirmation])
        
        if @user.save
            redirect_to root_path, flash: {success: '회원가입 성공'}
        else
            redirect_to :back, flash: {success: '회원가입 실패'}
        end
        
    end
    
    # 로그인 페이지
    def sign_in
    end
    
    # 실제 로그인 로직
    def user_sign_in
        #뷰로부터 데이터를 받아와서 처리하는 코드
        @user = User.find_by(user_name: params[:user_name])
        
        if @user.present? and @user.authenticate(params[:password])
            session[:sign_in_user] = @user.id 
            redirect_to root_path, flash: {alert: '로그인 성공'}
        else
            redirect_to :back, flash: {error: '로그인 정보를 확인하세요'}
        end
    end
    
    # 유저 정보 페이지
    def user_info
        
    end
    
    # 로그아웃 로직
    def sign_out
        #세션 지우는 코드
        session.delete(:sign_in_user)
        redirect_to :back, flash: {warning: "로그아웃 성공"}
    end
    
    private
    
    def set_user
        @user = User.new
    end
    
    def user_params
        #파라메터 들어가야됨
    end
    
    
end

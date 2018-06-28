class CafesController < ApplicationController
    before_action(:authenticate_user, except: [:index, :show])
    
    # 전체 카페 목록을 보여주는 페이지
    # -> 로그인 하지 않았을 때: 전체 카페 목록
    # -> 로그인 했을 떄: 유저가 가입한 카페 목록
    
    def index
        @cafes = Naver.all
    end
    
    
    #카페를 보여주는 show 페이지
    def show
        @cafe = Naver.find(params[:id])
        session[:current_cafe] = @cafe.id
    end
    
    #카페를 개설하는 페이지
    def new
        @cafe = Naver.new #form_for로 login을 만들지 못한 이유가 무엇이었는가?
    end
    
    #카페를 실제로 개설하는 로직
    def create
        @cafe = Naver.new(naver_params)#user의 id는?
        @cafe.master_name = current_user.user_name #왜래키는 인티져로 해놨는데 갑자기
        #이름으로 할 수 있나?
        
        if @cafe.save
            Membership.create(naver_id: @cafe.id, user_id: current_user.id)
            
            redirect_to cafes_path, flash: {success: "카페 생성 성공"}
        else
            p @cafe.errors
            redirect_to :back, flash: {warning: "카페 생성 실패"}
        end
    end
    
    def join_cafe
        # 카페 막아주기
        # 1. 가입버튼 안보이게 하기
        # 2. 중복 가입 체크 후 진행 -> 모델에 조건 추가
        cafe = Naver.find(params[:cafe_id])
        #사용자가 가입하려는 카페
        
        if cafe.is_member?(current_user)
            #가입실패
            redirect_to :back, flash: {danger: "카페 가입 실패"}
        else
            #가입성공
            Membership.create(naver_id: params[:cafe_id], user_id: current_user.id)
            redirect_to :back, flash: {success: "카페 가입 성공"}
        end
        
        
        
        
        
        
    end
    
    
    #카페 정보를 수정하는 페이지
    def edit
        @cafe = Naver.find(params[:id])
    end
    
    #카페 정보를 실제로 수정하는 로직
    def update
        # update를 new를 통해 할지, 아니면 update 메소드를 통해 할지...
    end
    
    private
    
    def naver_params
        params.require(:naver).permit(:title, :description)
        #, :naver_id
    end
    
end

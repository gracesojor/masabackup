class DetailsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  # logged_in_userアクションメソッドを定義してるのは、userコントローラーだが、
  # userコントローラーを使うページ内では、定義してないmicropostaコントローラーでも使える。
  # :create :destroyが、logged_in_user(ログインしてる時)のみ使える。
  
   before_action :correct_user, only: :destroy
   #ダブルバリデーション　（logged_in_userでcorrect_userでないと削除不可）
   #カレントユーザーかの確認。
   
   
  def index
    @details =Detail.paginate(page: params[:page]) 
  end
  
  def show
    @detail = Detail.find(params[:id])
  end

  def new
    @detail = Detail.new
  end
  
  def edit
    @detail = Detail.find(params[:id])
  end
  
  def create
    #render plain: params[*topic] .inspect
    @detail = current_user.details.build(detail_params)
    if @detail.save
      flash[:success] = "投稿されました。"
      #sessionヘルパーで定義したやつ
      redirect_to root_url 
    else
       render 'new'
    end
  end
  
  def update
    @detail = Detail.find(params[:id])
    if @detail.update(detail_params) #通常、セキュリティ入れる
      redirect_to root_url
    else
      render 'edit'
    end
  end
  
  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy
      redirect_to root_url
  end


  private

  def detail_params
    params.require(:detail).permit(:company_name, :company_name_sounds, :company_president, :company_president_sound, :company_post_number, :company_place, :company_place_detail, :company_call_number, :company_fax_number, :company_branch, :company_type, :company_union, :company_reception, :company_reception_sound, :company_position, :company_post_number_contact, :company_place_contact, :company_call_number_contact, :company_call_number_contact_name_1, :company_call_number_contact_tel_1, :company_call_number_contact_name_2, :company_call_number_contact_tel_2, :company_call_number_contact_name_3, :company_call_number_contact_tel_3, :company_call_number_contact_name_4, :company_call_number_contact_tel_4, :company_call_number_contact_name_5, :company_call_number_contact_tel_5, :company_call_number_contact_name_6, :company_call_number_contact_tel_6, :company_call_time_from_1, :company_call_time_from_2, :company_call_time_to_1, :company_call_time_to_2, :company_fax_number_contact, :company_call_number_emergency, :company_url, :company_mail_address, :company_place_detail, :company_place_detail_contact, :company_pr)
  end
  
  
  def correct_user
     @detail = current_user.details.find_by(id:params[:id])
     redirect_to root_url if @detail.nil?
  end

end

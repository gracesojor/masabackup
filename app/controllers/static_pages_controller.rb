class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :help]
  before_action :correct_user, only: [:destroy, :help]

  before_action :admin_user, only: [:destroy, :help]
  
  
  helper_method :sort_column, :sort_direction
    
  def home
   
    
    #@sells = Sell.all.order(sort_column + ' ' + sort_direction)
    #@users =User.where(all: ort_column + ' ' + sort_direction)   
    @sells = Sell.all.order(sort_column + ' ' + sort_direction).paginate(page: params[:page])
    #1
    #@micropost = current_user.microposts.build if logged_in?
    #2
    #@micropost = current_user.microposts.build
      
      #ページ左側からポストを作るため。build = new
      #newとbuildの違いは、buildは制限がないものを構築する場合。
      
    #@feed_items = current_user.feed.paginate(page: params[:page])
      # .feed - オリジナルメソッド　in モデル
      #ニュースフィードに表示する情報を引っ張る。
      #見つけるだけ　←フィードをアウトプットするための
      #特定のユーザーのマイクロポストを全部見るける
      # .paginate - レザブドメソッド - これがループの役割！
    

      #.order(sort_column + ' ' + sort_direction)
      
      
  # def index
  #   # 設定
  #   if @sort  == session[:sort]
  #     @direction = session[:direction] == 'asc' ? 'desc' : 'asc'
  #   else
  #     @direction = 'asc'
  #   end
  #   # データ呼び出し
  #   @messages = Message.order(@sort + ' ' + @direction).page(params[:page])
  #   # セッション保存
  #   session[:sort] = @sort
  #   session[:direction] = @direction
 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @messages }
  #   end
  # end
    
    
      #@sells = Sell.order('id ASC').reorder('name DESC')

  end

  def about
  end

  def help
    #@users =User.all(page: params[:page]) 
    @users =User.paginate(page: params[:page]) 
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def contact
  end
  

  
  
  private

  def sell_params
    params.require(:sell).permit(:name, :maker, :number, :status, :place, :type_machine, :price, :removal_date, :remnant, :stage, :condition, :remarks)
  end
  
 def correct_user
     @sell = current_user.sells.find_by(id:params[:id])
     redirect_to root_url if @sell.nil?
 end
  
  
   
  def sort_column
    Sell.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end



  
end
#————— 
# つまり、テンプレではめれないような独特な動きをするサイトを作りたければ、
# HTMLだけのVCを作って、システム本体のMVCも作って、
# MVCの方でadminなどの制限のほとんどない、
# なんでもありシステム(とりあえずの全体のシステム)を作り、
# その後、一部をVCのコントローラーを使うことで使わせてもらう。
# このVC-MVCシステムが最強。
# サイトマップ的にいうと、基本全部をVCで作るノリで、
# MVCの方でそのままwebページとして成り立っちゃう部分はMVCを使う。
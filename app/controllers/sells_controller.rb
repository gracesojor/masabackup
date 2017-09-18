class SellsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :edit, :update, :delete]
  before_action :correct_user, only: [:edit, :update, :delete]

  
  
  
  
  
  helper_method :sort_column, :sort_direction
  #helper使えるように

  def index
    @sells = Sell.all.order(sort_column + ': :' + sort_direction)
    #@sells = Sell.order(params[:sort] + ': :' + params[:direction])
    #@sells = Sell.order(params[:sort])
    #.orderが並び替え
  end

  def show
    @sell = Sell.find(params[:id])
  #  @sell = current_user.sells.find(sell_params)
  end

  def new
    @sell = Sell.new
  end
  
  def edit
    @sell = Sell.find(params[:id])
  end
  
  def create
     @sell = current_user.sells.build(sell_params)
     #@sell = Sell.build(sell_params)
     if @sell.save
       flash[:success] = "flash success!"
       redirect_to root_url
     else
       @sell = []
       flash[:danger] = "not successed please try again!"
       redirect_to new_sell_path
     end
  end



  def update
    @sell = Sell.find(params[:id])
    if @sell.update(sell_params) #通常、セキュリティ入れる
      redirect_to root_url #通常、redirect_to ★url_path
    else
      render 'edit'
    end
  end
  
  # def destroy
  #   @sell = Sell.find(params[:id])
  #   @sell.destroy
  #     redirect_to root_url
  # end
  
  def destroy
    # @micropost = current_user.micropost.find(params[:id])
    # ここに直で書いてしまうとバリデーションが効かない。
    
    @sell.destroy
    flash[:success] = "投稿は削除されました"
    
    # redirect_to users_path
    #これだと、ユーザーページでもトップに飛んでしまう。
    
    redirect_to request.referrer || root_url
    #どのページでもリダイレクトするためのコピペテンプレ。
    #request.referrerメソッド
    
  end
    
    

  private
  
  
   def correct_user
     @sell = current_user.sells.find_by(id:params[:id])
     redirect_to root_url if @sell.nil?
   end
 

  def sell_params
    params.require(:sell).permit(:name, :maker, :number, :status, :place, :type_machine, :price, :removal_date, :remnant, :stage, :condition, :remarks)
  end

  def sort_column
      Sell.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
  
end
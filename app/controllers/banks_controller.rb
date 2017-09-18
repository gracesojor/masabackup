class BanksController < ApplicationController

def index
  @banks =Bank.paginate(page: params[:page]) 

end
      
def edit
  @bank = Bank.find(params[:id])
end


 
end
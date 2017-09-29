class ModeratorsController < ApplicationController
  before_action :authenticate_user!

  def new
   @sales=User.where(role:"Sale",moderator_id: nil)
   respond_to do |format|
     format.json {render   json: @sales}
   end
  end

  def edit
  end


  def show
    respond_to do |format|
    @sale=Shop.where(id: params[:id]).first
      format.json {render   json: @sale}
    end
  end

  def shops
    @moderator=current_user
    # we get moderators that belongs to that superadmins
    @sales= @moderator.sales
    @shops=[]
    @sales.each do |sale|
          sale.shops.each do |shop|
           @shops.push(shop)
          end
      end
    respond_to do |format|
       format.json{render json: @shops}
       format.html{render 'index'}
    end
  end
  def index
    @moderator=current_user
    # we get moderators that belongs to that superadmins
    @sales= @moderator.sales
    @shops=[]
    @sales.each do |sale|
          sale.shops.each do |shop|
           @shops.push(shop)
          end
      end
    respond_to do |format|
       format.json{render json: @sales}
       format.html{render 'index'}
    end
  end

  def assign
     @moderator=current_user
     @sale=User.find(params[:id])
     @moderator.sales.push(@sale)
    # redirect_to(controller:"moderators",action:"index")
    respond_to do |format|
      @response=[]
      @response.push("Success Placing SalesPerson")
     format.json { render json: @response }
     format.html
   end
  end
  # this action is responsible for running the creation of the new moderator by the superadmin
  def create
   # here moderator object is created with parameters
   @moderator = Moderator.new(moderator_params)
   puts "--------------"
   # printing session variable on console
   puts session[:current_user_id]
   # searching for superadmin under which this moderator should exists
   @superadmin=Superadmin.first
   # inserting the moderator inside the superadmin
   @superadmin.moderators << @moderator
   # checking if the superadmin is valid to be saved
   if @superadmin.save!
     # redirecting the controller to the index page after adding is successfull
     redirect_to(controller: "superadmins" , action: "index")
   end
end

  def moderator_params
   # permiting porameters provide us with facility to prevent security attacks
   params.require(:moderator).permit(:name,:email,:contact,:password)
  end

  # this method is responsible for deleting the sale person
  def delsale
    # getting the moderator responsible for current session sales persons
    @moderator=current_user
    # we get salesperson that belongs to that moderator
    @sales = @moderator.sales
    # we see if a delete is pressed bcz on delete pressed we will get id in the link
    if params[:id]
      # deleting the particular sale person
      User.find(params[:id]).destroy
      # redirecting to the delete page again after delete
      #redirect_to controller: "moderators" ,action:"delsale"
      respond_to do |format|
        @response=[]
        @response.push("Success Deleting SalesPerson")
       format.json { render json: @response }
       format.html
       end
    end
  end

  def approve
    @shop=Shop.where(id:params[:id]).first
    @shop.approve_status='1'
    @shop.save
    redirect_to(controller: 'moderators' , action: 'index')
  end

  def remove
     @shop=Shop.find(params[:id])
     @shop.destroy
     redirect_to(controller: 'moderators' , action: 'index')
   end

   def reject
     @shop=Shop.where(id:params[:id]).first
     @shop.approve_status='0'
     @shop.save
     redirect_to(controller: 'moderators' , action: 'index')
   end

   def search
   respond_to do |format|
     @moderator=current_user
     # we get moderators that belongs to that superadmins
     @sales= @moderator.sales
     puts @sales
     @sales_new = @sales.reject{|sale| !sale.name.include?(params['search'])}
     puts @sales_new
     format.json { render json: @sales_new }
     format.html { 'index' }
   end
 end
end

class SalesController < ApplicationController
  before_action :authenticate_user!
  def new

  end


  def newShop
  if request.post?
     @shop=Shop.new(name: params[:name])
     city=City.where(name: params[:city]).first
     area=Area.where(name: params[:area]).first
     category=Category.where(name: params[:category]).first
     sale=User.find(params[:id])
     subcategory=Subcategory.where(name: params[:subcategory]).first
     sale.shops.push(@shop)
     city.shops.push(@shop)
     area.shops.push(@shop)
     category.shops.push(@shop)
     subcategory.shops.push(@shop)
     redirect_to(sales_url)
  end
 if request.get?
   @city_names=[]
   City.all.each do |city|
     @city_names.push(city.name)
   end
   @area_names=[]
   Area.all.each do |area|
     @area_names.push(area.name)
   end
   @category_names=[]
   Category.each do |category|
      @category_names.push(category.name)
   end

   @sub_category_names=[]
   Subcategory.each do |subcategory|
      @sub_category_names.push(subcategory.name)
   end
 end
end


  def index
  @sale=current_user
  @shops=@sale.shops
  end

  def create
     @sale=Sale.new(sale_params)
     @moderator=Moderator.find_by_id(session[:current_moderator_id])
     @moderator.sales << @sale
    if @moderator.save!
      redirect_to(controller: 'moderators' , action: 'index')
    end
  end
  def sale_params
    params.require(:sales).permit(:name,:email,:password,:contact)
  end

  def edit
    if request.post?
    p "-------------"+params[:shop_id]
    @shop=Shop.where(id:params[:shop_id]).first
    @city=City.where(name:params[:city]).first
    @area=Area.where(name:params[:area]).first
    @category=Category.where(name:params[:category]).first
    @city.shops.push(@shop)
    @area.shops.push(@shop)
    @category.shops.push(@shop)
    @shop.update(name:params[:name])
    redirect_to(sales_url)
    end
    if request.get?
    @shop=Shop.find(params[:id])
    @city_names=[]
    City.all.each do |city|
    @city_names.push(city.name)
    end

    @area_names=[]
    Area.all.each do |area|
    @area_names.push(area.name)
    end

    @categories=Category.all
    @category_names=[]
    @categories.each do |category|
    @category_names.push(category.name)
    end

    @sub_categories=Subcategory.all
    @sub_category_names=[]
    @sub_categories.each do |sub_category|
    @sub_category_names.push(sub_category.name)
     end
     render('update')
   end
  end

  def remove
   Shop.find(params[:id]).destroy
   redirect_to(controller: 'sales' , action: 'index')
  end
end

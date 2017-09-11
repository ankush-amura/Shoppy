class CustomersController < ApplicationController
   before_action :authenticate_user!

  def new
  end
  def index
     @shops=Shop.all
   end

  def comment
  id=params[:id]
  @shop=Shop.find(id)
  @comments=@shop.reviews
  render('comment')
  end

def commented
  comment=params[:comment]
  @review=Review.new(message: comment)
  @shop=Shop.where(id: params[:shop_id]).first
  p @shop
  @shop.reviews.push(@review)
  p current_user
  current_user.reviews.push(@review)
  @shops=Shop.all
  render('index')
end
  def edit

  end
  def reply
     shop_id=params[:shop_id]
     comment_id=params[:comment_id]
     reply=params[:reply]
     @shop=Shop.where(id: shop_id).first
     @review=Review.where(id: comment_id).first
     @reply=Review.new(message: reply)
     @review.replies.push(@reply)
     current_user.reviews.push(@reply)
     @shop.reviews.push(@reply)
     p @reply
     @shops=Shop.all
     render('index')
  end

  def search
    if request.post?
     city=City.where(name:params[:city])
     area=Area.where(name:params[:area])
     category=Category.where(name:params[:category])
     name=params[:name]
     @shops=Shop.where(name:name,city_id:city.first.id,area_id:area.first.id,category_id:category.first.id)
     render('results')
    end
    if request.get?
      @city=City.all
      @city_names=[]
      @city.each do |city|
          @city_names.push(city.name)
      end
      @area=Area.all
      @area_names=[]
      @area.each do |area|
      @area_names.push(area.name)
      end
      @category=Category.all
      @category_names=[]
      @category.each do |category|
      @category_names.push(category.name)
      end
      @sub_category=Category.all
      @sub_category_names=[]
      @sub_category.each do |sub_category|
      @sub_category_names.push(sub_category.name)
      end
    end
  end
end

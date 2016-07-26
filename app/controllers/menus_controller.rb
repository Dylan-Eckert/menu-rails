class MenusController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menus = @restaurant.menus
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.build()
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.build(menu_params)

    if @menu.save
      redirect_to @menu
    else
      render :new
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])

    if @menu.update menu_params
      redirect_to @menu
    else
      render :edit
    end
  end

  def show
    @menu = Menu.find(params[:id])
    @menu_item = @menu.menu_items
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    redirect_to restaurant_menus_path(@menu.restaurant)
  end

  private
    def menu_params
      params.require(:menu).permit(:name)
    end
end

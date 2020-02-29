class CouponsController < ApplicationController

  def index
    @coupons = Coupon.all
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def new
  end

  def create
    @coupon = Coupon.new(coupon_code: params[:coupon][:coupon_code], store: params[:coupon][:store])
    if @coupon.save
      redirect_to coupon_path(@coupon)
    else
      render :new
    end
  end

  private 
  def coupon_params
    params.permit(:coupon_code, :store)
  end

end

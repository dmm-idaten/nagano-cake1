class Admins::OrderDetailsController < ApplicationController
	before_action :authenticate_admin!

	def update
	  order_detail = OrderDetail.find(params[:order_detail][:detail_id])
	  order_detail.update(making_status: params[:order_detail][:making_status].to_i)
	  redirect_to admins_order_path(order_detail.order)
	end

	private
	def order_detail_params
		params.require(:order_detail).permit(:making_status)
	end
end

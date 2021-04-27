class Admins::OrderDetailsController < ApplicationController
	before_action :authenticate_admin!

	def update
	  # order_detail = OrderDetail.find(params[:order_detail][:detail_id])
	  # order_detail.update(making_status: params[:order_detail][:making_status].to_i)
	  # redirect_to admins_order_path(order_detail.order)
	  
		# order_detail = OrderDetail.find(params[:id])
		# order_detail.update(order_detail_params)
	  order_detail = OrderDetail.find(params[:order_detail][:detail_id])
	  order_detail.update(making_status: params[:order_detail][:making_status].to_i)


		case order_detail.making_status
		 when "製作中"
				order_detail.order.update(order_status: "製作中")
		 when "製作完了"
			if order_detail.order.order_details.all?{|order_detail| order_detail.making_status == "製作完了"}
				order_detail.order.update(order_status: "発送準備中")
			end
		end
		# redirect_to admins_order_path(order_detail.order.id)
	  redirect_to admins_order_path(order_detail.order)
	  
	  
	end

	private
	def order_detail_params
		params.require(:order_detail).permit(:making_status)
	end
end

class AddressesController < ApplicationController

	def index
		@address_new = Address.new
		@addresses = Address.all
	end

	def create
		@address = Address.new(address_params)
		@address.save
		redirect_to customers_addresses_path
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		address = Address.find(params[:id])
		address.update(address_params)
		redirect_to customers_addresses_path
	end

	def destroy
		address = Address.find(params[:id])
		address.destroy(address_params)
		redirect_to customers_addresses_path
	end

	private

	def address_params
		params.require(:address).permit(:postal_code, :address, :name)
	end

end

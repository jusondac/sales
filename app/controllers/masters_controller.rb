class MastersController < ApplicationController
	before_action :set_master, only: [:show, :edit, :update,:destroy]
	
	def index
		if Role.find_by_name('master')
			@masters = User.all
		else
			redirect_to root_url
		end
	end

	def show
	end

	def new
		@master = User.new
	end

	def edit
	end

    def update
      respond_to do |format|
      	@user = User.find_by_email(params[:email])
      	@role = Role.find_by_id(params[:role])
      	@user.update_attributes(role_id: @role.id)
        if @master.update(master_params)
          format.html { redirect_to masters_path , notice: 'master was successfully updated.' }
        else
          format.html { render :edit }
          format.json { render json: @master.errors, status: :unprocessable_entity }
        end
      end
    end

	private
    
    def set_master
      @master = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_params
      params.permit(:email, :roles_attributes => [:name])  
    end
end

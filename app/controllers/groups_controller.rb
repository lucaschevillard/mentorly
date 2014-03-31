class GroupsController < ApplicationController


	def index

		@groups = Group.all

	end


	def show


		@group = Group.find(params[:id])

	end

	def new

		@group = Group.new

	end

	def create

		@group = Group.create(group_params)

		p "===================="
		p @group
		p "===================="

		redirect_to groups_path
		# render text: params.inspect
	end

	def edit

		@users = User.all
		@group = Group.find(params[:id])
		if current_user == @group
			render 'edit'
		else
			redirect_to root_path
		end

	end

	def update

		@group = Group.find(params[:id])
		if current_user == @user
			@group.update(group_params)
			redirect_to @group
		else
			redirect_to root_path
		end

	end

	def destroy

		@group = Group.find(params[:id])
		@group.destroy
		redirect_to group_path

	end

	private

	def group_params
		params.require(:group).permit(:name, :user_id)
	end

end

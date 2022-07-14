class PostMailer < ApplicationMailer
	default from: 'exampleaddress@gmai.com'

	def new_post_email
		@post = params[:post]
		mail( to: 'receiver@gmail.com', subject: 'New post')
	end

	def edit_post_email
		@post = params[:post]
		mail( to: 'receiver@gmail.com', subject: 'Post updated')
	end
end
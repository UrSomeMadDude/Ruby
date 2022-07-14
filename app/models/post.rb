class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	belongs_to :user

	after_commit :post_created_email, on: :create
	after_commit :post_updated_email, on: :update

	def author?(user)
		user == self.user
	end

	private

	def post_created_email
		PostMailer.with(post: self).new_post_email.deliver
	end

	def post_updated_email
		PostMailer.with(post: self).edit_post_email.deliver
	end
end

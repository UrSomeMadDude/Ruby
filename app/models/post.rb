class Post < ApplicationRecord
	validates :author, presence: true
	has_many :comments, dependent: :destroy
	belongs_to :user

	after_commit :post_created_email, on: :create
	after_commit :post_updated_email, on: :update

	private

	def post_created_email
		PostMailer.with(post: self).new_post_email.deliver
	end

	def post_updated_email
		PostMailer.with(post: self).edit_post_email.deliver
	end
end

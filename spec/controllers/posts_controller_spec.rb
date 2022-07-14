require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	let(:user) {create :user}
	before {sign_in user}

	describe '#index' do
		subject {process :index}
		let(:posts) {create_list(:post, 5)}
		it 'renders the template' do
			subject
			expect(response).to render_template :index
		end
		it 'assigns @posts' do
			subject
			expect(assigns(:posts)).to eq posts
		end

		context "when user is not signed in" do
			before {sign_out user}
			it 'redirects to the sign in page' do
				subject
				expect(response).to redirect_to new_user_session_path
			end
		end
	end

	describe '#create' do
		subject {process :create, method: :post, params: params}

		let (:params) { {post: attributes_for(:post, user: create(:user)) } }

		it 'creates a post' do
			expect {subject}.to change(Post, :count).by(1)
		end

		it 'redirects to post page' do
			subject
			expect(response).to redirect_to post_path(Post.last)
		end

		it 'assigns post to current user' do
			subject
			expect(assigns(:post).user).to eq user
		end
	end

	describe '#destroy' do
		subject {process :destroy, method: :delete, params: params}
		let!(:post) { create :post, user: user}
		let (:params) {{ id: post.id }}

		it 'deletes the post' do
			expect {subject}.to change(user.posts, :count).by(-1)
		end
	end
end

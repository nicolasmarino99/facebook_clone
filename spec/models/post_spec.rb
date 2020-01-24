require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.new(content: 'This is a post.') }

  # Validations test
  context 'validation tests' do
    it 'Post must have a content' do
      post.content = nil
      expect(post).to_not be_valid
    end

    it 'Post length should be between 2 and 240' do
      post.content = 'P'
      expect(post).to_not be_valid
    end

    it 'Post length should be between 2 and 240' do
      post.content = 'P' * 242
      expect(post).to_not be_valid
    end
  end

  # Associations' tests
  context 'Associations tests' do
    it 'Post has one creator' do
      post = Post.reflect_on_association(:creator)
      expect(post.macro).to eq(:belongs_to)
    end
  end
end

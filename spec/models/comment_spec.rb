require 'rails_helper'

RSpec.describe Comment do
  describe 'associations' do
    def association
      described_class.reflect_on_association(:article)
    end

    # is associated with comments
    it 'has an association with article' do
      expect(association).to_not be_nil
      expect(association.name).to eq(:article)
    end

    it 'has a set inverse of' do
      expect(association.options[:inverse_of]).to_not be_nil
      expect(association.options[:inverse_of]).to eq(:comments)
    end

    # ensure we have title and content on creation
    it 'validates presence of content on creation' do
      expect(Comment.create(content: 'content')).to be_valid
      expect(Comment.create).to be_invalid
    end
  end
end

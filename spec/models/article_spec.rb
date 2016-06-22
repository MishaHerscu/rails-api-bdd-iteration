require 'rails_helper'

RSpec.describe Article do
  describe 'associations' do
    def association
      described_class.reflect_on_association(:comments)
    end

    # is associated with comments
    it 'has an association with comments' do
      expect(association).to_not be_nil
      expect(association.name).to eq(:comments)
    end

    # destroys associated comments when deleted
    it 'deletes associated comments when destroyed' do
      expect(association.options[:dependent]).to eq(:destroy)
    end

    it 'has a set inverse of record' do
      expect(association.options[:inverse_of]).to eq(:article)
    end

    # ensure we have title and content on creation
    it 'validates presence of title and content on creation' do
      expect(
        Article.create(title: 'test', content: 'content blah blah')
      ).to be_valid
      expect(
        Article.create(content: 'content of blach aesrgsg')
      ).to be_invalid
      expect(
        Article.create(title: 'content of blach aesrgsg')
      ).to be_invalid
    end
  end
end

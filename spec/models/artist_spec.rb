require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should validate_presence_of :bio }
    it { should validate_presence_of :genres }
    it { should validate_presence_of :image_path }
    it { should validate_presence_of :user_id }
  end

  describe 'relationships' do
    it { should have_many(:artist_events) }
    it { should have_many(:events).through(:artist_events) }
  end
end

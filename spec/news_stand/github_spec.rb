require 'spec_helper'

module NewsStand
  describe Github do
    it 'has a version number' do
      expect(NewsStand::Github::VERSION).not_to be nil
    end

    it 'does something useful' do
      expect(false).to eq(true)
    end
  end
end

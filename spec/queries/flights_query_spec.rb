describe FlightsQuery do
  context 'when no filters passed' do
    let!(:flights) { FactoryBot.create_list(:flight, 5) }
    let(:filters) { {} }

    it 'returns all flights' do
      expect(described_class.new(filters).call).to eq(flights)
    end
  end

  context 'when filter is not allowed' do
    let!(:flights) { FactoryBot.create_list(:flight, 5) }
    let(:filters) { { foo: :bar } }

    it 'ignores that filter' do
      expect(described_class.new(filters).call).to eq(flights)
    end
  end

  context 'valid filters' do
    let!(:flight1) { FactoryBot.create(:flight, from: 'Kyiv', destination: 'Munich', arrival: Time.new(2021, 11, 23, 12)) }
    let!(:flight2) { FactoryBot.create(:flight, from: 'Lviv', destination: 'Munich') }
    let!(:flight3) { FactoryBot.create(:flight, from: 'Lutsk', destination: 'Munich') }
    let!(:flight4) { FactoryBot.create(:flight, from: 'Lviv', destination: 'Warsaw') }

    context 'one filter' do
      let(:filters) { { from: 'Lviv' } }

      it 'applies fliter' do
        expect(described_class.new(filters).call).to contain_exactly(flight2, flight4)
      end
    end

    context 'two filters' do
      let(:filters) { { from: 'Lutsk', destination: 'Munich' } }

      it 'applies fliters' do
        expect(described_class.new(filters).call).to contain_exactly(flight3)
      end
    end

    context 'two filters w/o match' do
      let(:filters) { { from: 'Rivne', destination: 'Munich' } }

      it 'applies filters' do
        expect(described_class.new(filters).call).to be_empty
      end
    end

    context 'search by arrival' do
      let(:filters) { { arrival: '2021-11-23' } }

      it 'applies filter' do
        expect(described_class.new(filters).call).to contain_exactly(flight1)
      end
    end
  end
end

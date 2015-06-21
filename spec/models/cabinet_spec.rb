require 'rails_helper'

RSpec.describe Cabinet, type: :model do
  it 'can contain medicines' do
    cabinet = Cabinet.new(medicines: [Medicine.new, Medicine.new])

    expect(cabinet.medicines.length).to eq(2)
  end

  it 'can add a new medicine' do
    cabinet = Cabinet.create!

    cabinet.add_to_cabinet(set_id: '1234', name: 'Advil')
    expect(cabinet.medicines.length).to eq(1)
    expect(cabinet.medicines[0].name).to eq('Advil')
  end

  it 'can add find an existing medicine and add it disregarding name param' do
    cabinet = Cabinet.create!
    Medicine.create!(set_id: '1234', name: 'Advil')

    cabinet.add_to_cabinet(set_id: '1234', name: 'Tylenol')
    expect(cabinet.medicines.length).to eq(1)
    expect(cabinet.medicines[0].name).to eq('Advil')
  end
end
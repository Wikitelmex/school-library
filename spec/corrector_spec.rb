require_relative '../common/corrector'

describe Corrector do
  before :each do
    @corrector = Corrector.new
    @corrector1 = @corrector.correct_name('helloiamahmedadel')
    @corrector2 = @corrector.correct_name('iamarubydeveloperatmicroverse')
  end

  it 'match capitalization and slice the first 10 letters' do
    expect(@corrector1).to match 'Helloiamah'
  end

  it 'match capitalization and slice the first 10 letters' do
    expect(@corrector2).to match 'Iamarubyde'
  end
end

$counter = 0

describe "let" do
  let(:count) { $counter += 1 }

  it "memorize the value" do
    expect(count).to eq(1) # first time is loade
    expect(count).to eq(1) # second time is kept in cache
  end

  it "It's not cached between tests" do
    expect(count).to eq(2)
  end
end

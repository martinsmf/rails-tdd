describe "Matchers of equality " do
  it "#equal - it tests if it's the same object" do
    x = "ruby"
    y = "ruby"

    expect(x).not_to equal(y)
    expect(x).to equal(x)
  end
  it "#be - it tests if it's the same object" do
    x = "ruby"
    y = "ruby"

    expect(x).not_to be(y)
    expect(x).to be(x)
  end

  it "#eql - is tests if it's the same value" do
    x = "ruby"
    y = "ruby"

    expect(x).to eql(y)
  end
  it "#eq - is tests if it's the same value" do
    x = "ruby"
    y = "ruby"

    expect(x).to eq(y)
  end
end

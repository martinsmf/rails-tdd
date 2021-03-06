RSpec::Matchers.define_negated_matcher :an_array_exluding, :include

# tag filters, can be used of next away: "NAME:true" or "NAME: 'NAME'" or ":NAME"

describe Array.new([1, 2, 3]), "Array", :collection do
  it "#include" do
    expect(subject).to include 2
    expect(subject).to include(2, 1)
  end

  it { expect(subject).to an_array_exluding(4) }

  it "#mathc_array", :slow do
    expect(subject).to match_array([1, 2, 3])
  end

  it "#contain_exactly" do
    expect(subject).to contain_exactly(1, 2, 3)
  end
end

describe "aggregate_faliures_spec" do
  # it "be_between inclusive / falhas agregadas bloco" do
  #   aggregate_failures do
  #     expect(5).to be_between(2, 7).inclusive
  #     expect(1).to be_between(2, 7).inclusive
  #     expect(8).to be_between(2, 7).inclusive
  #   end
  # end

  # it "be_between inclusive / simbolo", :aggregate_failures do
  #   expect(5).to be_between(2, 7).inclusive
  #   expect(1).to be_between(2, 7).inclusive
  #   expect(8).to be_between(2, 7).inclusive
  # end

  it "be_between inclusive" do
    expect(5).to be_between(2, 7).inclusive
    expect(1).to be_between(2, 7).inclusive
    expect(8).to be_between(2, 7).inclusive
  end

  it "be_between inclusive" do
    expect(5).to be_between(2, 7).inclusive
    expect(1).to be_between(2, 7).inclusive
    expect(6).to be_between(2, 7).inclusive
  end
end

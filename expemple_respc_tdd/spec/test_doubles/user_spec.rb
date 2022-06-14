describe "Test Double", :double do
  it "--" do
    user = double("User")
    allow(user).to receive_messages(name: "Jack", password: "secret")
    user.name
    user.password
  end

  it "--2" do
    user = double("User")
    allow(user).to receive(:name).and_return("Matheus")
    allow(user).to receive(:password).and_return("scret")
    user.name
    user.password
  end
end

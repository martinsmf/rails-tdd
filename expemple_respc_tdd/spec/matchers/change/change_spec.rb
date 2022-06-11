require "contador"

describe "Matcher Chane" do
  it { expect { Contador.increment }.to change { Contador.qtd } } #qtd 1
  it { expect { Contador.increment }.to change { Contador.qtd }.by(1) } # qtd 2
  it { expect { Contador.increment }.to change { Contador.qtd }.from(2).to(3) } # qtd 3
end

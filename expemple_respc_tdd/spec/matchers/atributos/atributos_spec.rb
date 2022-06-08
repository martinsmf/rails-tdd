require 'pessoa'

describe 'Attribute' do
  it 'should ' do
    pessoa = Pessoa.new
    pessoa.nome = 'Matheus'
    pessoa.years_old = 20

    expect(pessoa).to have_attributes(nome: starting_with('M'), years_old: (a_value >= 20))
  end

end
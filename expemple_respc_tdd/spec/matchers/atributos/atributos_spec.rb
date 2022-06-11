require "pessoa"

describe "Attribute" do
  # before(:each) do # can be used :exemple
  #   puts ">>>>>>> ANTES DE CADA TESTE"
  #   @pessoa = Pessoa.new
  # end

  # after(:each) do
  #   @pessoa.nome = "Sem nome"
  #   puts ">>>>>>> DEPOIS DE CADA TESTE #{@pessoa.inspect}"
  # end

  around(:each) do |test|
    puts ">>>>> ANTES DE CADA TESTE"
    @pessoa = Pessoa.new

    test.run

    @pessoa.nome = "Sem nome"
    puts ">>>> DEPOIS DE CADA TESTE #{@pessoa.inspect}"
  end

  it "should" do
    @pessoa.nome = "Matheus"
    @pessoa.years_old = 20
    expect(@pessoa).to have_attributes(nome: starting_with("M"), years_old: (a_value >= 20))
  end

  it "should" do
    @pessoa.nome = "João"
    @pessoa.years_old = 25
    expect(@pessoa).to have_attributes(nome: starting_with("J"), years_old: (a_value >= 20))
  end
end

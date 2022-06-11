class Pessoa
  attr_accessor :nome, :years_old
  attr_reader :status

  def feliz!
    @status = "Sentindo-se Feliz!"
  end

  def triste!
    @status = "Sentindo-se Triste!"
  end

  def contente!
    @status = "Sentindo-se Contente!"
  end
end

class MoviePage
  include Capybara::DSL
  #cucumber não entende que vc que escrever códigos capybara
  #então deve inserir no include no início.
def initialize #iniciar o contrutor para mudar o table tbody tr que é apresentado em 3 lugares
  @movie_list_css = "table tbody tr" # se mudar mexe apenas nesse e não em todos que tem.
end

  def form
    MovieAdd.new #metodo para salvar os filmes, form retornar instância do movie_add
  end

  def sweet_alert
    Sweet_Alert.new
  end

  def add #metodo para acessar página de cadastro.
    find(".movie-add").click
  end
  #$('.nc-simple-add').click();

  def movie_tr(title) #find pra garantir que ganha pegar o status do filme ele vai pegar no filme certo na tabela certa.
   find(@movie_list_css, text: title) 
  end

  def remove(title) # title já vai receber as informações table tbody tr então não é preciso passar novamente todo caminho 
    # vai receber apenas o dados do campo que já tem todos os parâmetros para achar o tr e o excluir.
    movie_tr(title).find(".btn-trash").click  # usa . antes do btn pq é uma classe.
  end

  def has_no_movie(title)
    page.has_no_css?(@movie_list_css, text: title) #pergunta se tem na tr um título com dbz e se retorna falso, confirmando que não tem a linha
  end
  #has_no_css? metodo do capybara que deve confirmar se encontrou no css a Tr na linha do arquivo.

  def has_movie(title)
    page.has_css?(@movie_list_css, text: title)
  end
end

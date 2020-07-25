class MovieAdd
  include Capybara::DSL

  def create(movie) #metodo movie que e catagolado lá no movie_stes no metodo yaml onde está toda massa de teste.
    find("input[name=title]").set movie["title"]
   
    select_status(movie["status"]) unless movie["status"].empty?
   
    find("input[name=year]").set movie["year"]
    find("input[name=release_date]").set movie["release_date"]
    find(".card-title").click
   
    add_cast(movie["cast"])
   
    find("textarea[name=overview]").set movie["overview"]
   
    upload(movie["cover"]) unless movie["cover"].empty? #No cenário quando não tem capa para cadastro, então unless retornar um valor falso 
       #(if verdadeiro), então se não tive a capa não vai buscar, se tem valor vai fazer upload da capa.
   
    find("#create-movie").click # (#) jogo da velha simboliza nesse caso ID
  end
    
  def upload(file) #  metodo para fazer upload da foto do filme
    cover_file = File.join(Dir.pwd, "features/support/fixtures/cover/" + file) #usar barra padrão do Win (\) padrão linux ou mac(/)
    cover_file = cover_file.tr("/", "\\") if OS.windows? #tr metodo do ruby faz substring, para problema de não achar o caminho no win.
    # Dir.pwd vai inicicar a busca na pasta nflix do projeto, acima a referencia de onde vai buscar as imagens
    #um novo gem foi instalada pra resolver esse problema, para funcionar em todos os SO.
   
    Capybara.ignore_hidden_elements = false #para ignorar os elementos ocultos na página
    attach_file("upcover", cover_file) #essa variável que vai receber o filme.
    Capybara.ignore_hidden_elements = true
  end
   
  def add_cast(cast) # metodo para adicionar os atores, tendo em vista que estão dentro de array
    actor = find(".input-new-tag")
    cast.each do |a| #vai passar por todos array
      actor.set a
      actor.send_keys :tab
    #O comportamento do campo funciona uma tag normal e precisa teclar tab pra salvar, com isso vai ficar salvo dentro da variável
    #Cast no cdastro de filme é um array tem diversos nome para cadastro.
    end
  end
  
  def alert
    find(".alert").text #vai buscar o elemento que tem a classe alert e retorna o texto.
  end
   
  def select_status(status)
    #input que é o tipo do elemento, [atributo = valor]
    #combobox com 'ul' e'lis' tem esse tipo de customização.
    find("input[placeholder=Status]").click
    find(".el-select-dropdown__item", text: status).click #dentro só vai ter a variável status que vem do argumento (status)
    #ele passa o (movie["status"]) para metodo select_status que receve o valor lá dentro (status que tá dentro do ())
  end
end
    
    
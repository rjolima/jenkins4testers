Dado("que {string} é um novo filme") do |movie_code|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
  @movie = file[movie_code]
  Database.new.delete_movie(@movie["title"])
end
#dir.pwd buscar dados arquivos aparti da raiz do cucumber, todo valor catalogado será salvo em file

Dado("este filme já exite no catálogo") do
  Database.new.insert_movie(@movie)
end

Quando("eu faço o cadastro deste filme") do
  @movie_page.add
  @movie_page.form.create(@movie) #metodo responsável por criar um filme.
end

Então("devo ver o novo filme na lista") do
  result = @movie_page.movie_tr(@movie["title"]) # com isso vai buscar o resultado na linha certa onde filme foi cadastrado.
  expect(result).to have_text @movie["title"]
  expect(result).to have_text @movie["status"]  
end
#Seletor css ou Ponto (.) representa uma classe, o clicck para silumar a função na página para validar $('.nc-simple-add').click();

Então("devo ver a notificação {string}") do |expect_alert|
  expect(@movie_page.form.alert).to eql expect_alert
end

Dado("que {string} está no catálogo") do |movie_code|
  steps %{ 
    Dado que "#{movie_code}" é um novo filme
    E este filme já exite no catálogo
  }
  #Na feature pode ser usar MAS, porém no código é um dado (tudo que vem antes do quando - feature), então alterado o MAS para E 
  #tudo que vem antes do quando é uma pré condição na feature
  # O step usaso acima e movie_code novo filme, vai usar o step dele para executar um novo filme
  # é informando #{movie_code} ele vai chamar o step (é um novo filme), mas o valor de movie_code será DBZ
  #Com Dynamic Steps se mudar o arquvio de feature de lugar ou mudar implementação para catalogar o arquivo (file)
  # como isso o step não será impactado, não será necessário alterar aqui no dado, apenas no: file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
   
end

Quando("eu solicito a exclusão") do
  @movie_page.remove(@movie["title"]) #@movie pq? quando ele chama: "Dado que "#{movie_code}" é um novo filme" (step a cima) 
  #ele invoca o step todo: Dado("que {string} é um novo filme") do |movie_code| (primeiro) que deixa em memória dentro do contexto do step
  # a variável @movie disponível então consigo obter essa informação até o final do filme, fazendo com que tenha todas as informações necessá
  #rias para realizar todas validações 
end

Quando("eu confirmo a solicitação") do
  @movie_page.sweet_alert.confirm
end

Então("este item deve ser removido do catálogo") do
  expect(@movie_page.has_no_movie(@movie["title"])).to be true #pergunta se não existe um filte na lista e reponde que verdadeiro
end

Quando("cancelo a solicitação") do
  @movie_page.sweet_alert.cancel
end

Então("este item deve permanecer no catálogo") do
  expect(@movie_page.has_movie(@movie["title"])).to be true #pergunta se existe um filte na lista e reponde que verdadeiro
end
#language:pt
# o cenário ganhou a tag login, então já vai buscar as informaçoes dentro do login, valido pra todo cenário
@login 
Funcionalidade: Cadastro de filmes
    Para que eu possa disponibilizar novos títulos no catálogo
    Sendo um gestor de catálogo
    Posso cadastrar um novo filme

    @new_movie
    Esquema do Cenario: Novo filme
        O gestor de catálogo cadastrar um novo filme através do formulário
        e um novo registro é inserido no catálogo Ninjaflix.

        Dado que <codigo> é um novo filme
        Quando eu faço o cadastro deste filme
        Então devo ver o novo filme na lista

        Exemplos:
            | codigo     |
            | "ultimato" |
            | "spider"   |
            | "jocker"   |
            #todos os dados para filme estão dentro do Movies.yaml, para melhorar a visaulização e facilitar o entendimento da documentação.

    @attempt_movie
    Esquema do Cenario: Campos obrigatórios
        o gestor de catálogo tenta cadastrar um novo filem, mas esqueve
        de preencher um dos campos que são obrigatórios, em seguinda, o sistema
        exibe uma notificação para o usuário.

         Dado que <codigo> é um novo filme
         Quando eu faço o cadastro deste filme
         Então devo ver a notificação <texto>

        Exemplos:
      | codigo      | texto                                          |
      | "no_title"  | "Oops - Filme sem titulo. Pode isso Arnaldo?"  |
      | "no_status" | "Oops - O status deve ser informado!"          |
      | "no_year"   | "Oops - Faltou o ano de lançamento também!"    |
      | "no_date"   | "Oops - Quase lá, só falta a data de estréia!" |


    # Cenario: Sem nome
    #     Quando eu tento cadastrar um filme sem o nome
    #     Então devo ver a notificação "Oops - Filme sem titulo. Pode isso Arnaldo?"

    # Cenario: Sem status
    #     Quando eu tento cadastrar um filme sem o status
    #     Então devo ver a notificação "Oops - O status deve ser informado!"
    
    # Cenario: Ano de lançamento não informado
    #     Quando eu tento cadastrar um filme sem ano de lançamento
    #     Então devo ver a notificação "Oops - Faltou o ano de lançamento também!"
    
    # Cenario: Data de estréia não informada
    #     Quando eu tento cadastrar um filme sem a data de estréia
    #     Então devo ver a notificação "Oops - Quase lá, só falta a data de estréia!"

    @dup_movie 
    Cenario: Duplicado
        o gestor de catálogo tenta cadastrar um filme, porém o título
        já foi cadastrado em outro momento e o sistema notifica o usuário
        informando que o título já existe.

        Dado que "Deadpool 2" é um novo filme
        Mas este filme já exite no catálogo
        Quando eu faço o cadastro deste filme
        Então devo ver a notificação "Oops - Este titulo já existe no Ninjaflix."

        #Tudo que vem antes do quando é um pré condição a ser validada.
        # rodar todo cenário cucumber features\cadastro-de-filmes.feature
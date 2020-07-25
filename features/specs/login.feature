#language: pt

Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catálogo Ninjaflix
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema com o meu email e senha

@login_happy 
Cenário: Acesso
    Quando eu faço login com "tony@stark.com" e "pwd456"
    Então devo ser autenticado
    E devo ver "Tony Stark" na área logada

@login_hapless
Esquema do Cenario: Login sem sucesso
    Quando eu faço login com <email> e <senha>
    Então não devo ser autenticado
    E devo ver a mensagem de alerta <texto>

    Exemplos: 
      | email             | senha     | texto                          |
      | "tony@stark.com"  | "abc123"  | "Usuário e/ou senha inválidos" |
      | "404@yahoo.com"   | "abc123"  | "Usuário e/ou senha inválidos" |
      | ""                | "abcxpto" | "Opps. Cadê o email?"          |
      | "teste@gmail.com" | ""        | "Opps. Cadê a senha?"          |




#Documentação escrita em BDD
#rodar: cucumber -t @login_happy
# E > são précondições
#Quando e então as condições do processo se pode ou não e a resposta
# @login_hapless 
# Cenário: Senha inválida
#     Quando eu faço login com "tony@stark.com"​ e "abc123"
#     Então não devo ser autenticado
#     E devo ver a mensagem de alerta "Usuário e/ou senha inválidos"

# @login_hapless
# Cenário: Usuário não existe
#     Quando eu faço login com "404@yahoo.com" e "abc123"
#     Então não devo ser autenticado
#     E devo ver a mensagem de alerta "Usuário e/ou senha inválidos"

# @login_hapless
# Cenário: Email não informado
#     Quando eu faço login com "" e "abcxpto"
#     Então não devo ser autenticado
#     E devo ver a mensagem de alerta "Opps. Cadê o email?"

# @login_hapless
# Cenário: Senha não informada
#     Quando eu faço login com "teste@gmail.com" e ""
#     Então não devo ser autenticado
#     E devo ver a mensagem de alerta "Opps. Cadê a senha?" 
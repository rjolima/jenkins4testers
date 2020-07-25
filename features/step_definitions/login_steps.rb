# ficou mais limpo, mais simples e objetiva
# Um step definition não deve conter tanta lógica assim. Ele tem que ser pequeno e simples.

Quando("eu faço login com {string} e {string}") do |email, password|
   @login_page.go
   @login_page.with(email, password)
end
    
Então("devo ser autenticado") do
  expect(get_token.length).to be 147
#chamada javaScript no console
#window.localstorage.getitem("default_auth_token");
#window.localStorage.getItem("default_auth_token").length = verificar a quantidade caracteres 147
end
  
Então("devo ver {string} na área logada") do |expect_name|
   expect(@sidebar.logged_user).to eql expect_name
end

Então("não devo ser autenticado") do
   expect(get_token).to be nil # nil = null
end

Então("devo ver a mensagem de alerta {string}") do |expect_message|
   #@login_page = LoginPage.new #$(.alert);
   expect(@login_page.alert).to eql expect_message
end
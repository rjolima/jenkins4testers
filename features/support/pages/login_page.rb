#PageObjects esse processo é gerado para garantir que a munutençao no 
#código seja menor possível, caso algum css seja alterado.
#Facilitando a alteração em um único lugar em não em vários.  
#toda inteligencia do teste foi incapsulado dentro da class (oriente objeto)
#Transfere todos os recursos do capybara de chamar elementos para dentro do pageobjects

class LoginPage 
    include Capybara::DSL
    #cucumber não entende que vc que escrever códigos capybara
    #então deve inserir no include no início. 
    def go
      visit "/"
    end

    def with(email, pass)
        find("input[name=email]").set email
        find("input[name=password]").set pass
        click_button "Entrar"
    end

    def alert
        find(".alert").text
    end
end
    
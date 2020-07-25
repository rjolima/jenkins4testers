#sidebar é a barra lateral da tela do nflix
class SideBarView 
    include Capybara::DSL

    def logged_user
      find(".sidebar-wrapper .user .info span").text #já busca o elemento  retorna o texto (Tony Stark). 
      #Porque o span é um elemento do HTML (não tem ponto), os demais são classes.
      #$('.sidebar-wrapper .user .info span'); informa no seletor css para encontra melhor onde fica nome, garantido que não apareça em qq lugar da página.
    end
end
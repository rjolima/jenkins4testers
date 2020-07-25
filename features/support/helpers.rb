#retorno do Js não está na página, por isso um helprs para essa step definition.
#deve ser informado no: env.rb > require_relative "helpers"
#World(Helpers) todos os recursos do módulo helpers são nativos dentro da execução do cucumber
#Suporte code do cucumber
module Helpers
    def get_token
        #timeout = Capybara.default_max_wait_time #time padrão de 2s
        #timeout.times do #(substituído pelo 2.times do)
        3.times do
          js_script = 'return window.localStorage.getItem("default_auth_token");' #no capybara é preciso obter o retorno informando return 
          @token = page.execute_script(js_script) #busca token gerado no login.
          break if @token != nil 
          #breack para verificar se o token foi localizado na primeira tentativa, se sim, não deve executar a segunda (2.times). nil = null 
          # se o token é diferente de nulo!
          sleep 1
        end
        @token
    end
end

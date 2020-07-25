class Sweet_Alert
  include Capybara::DSL

  def confirm
    find(".swal2-confirm").click
  end

  def cancel
    find(".swal2-cancel").click
  end
end
# tela da modal de confirmação de exclusão e cancelamento para deletar filme

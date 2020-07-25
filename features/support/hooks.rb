require "base64"

Before do
  @login_page = LoginPage.new
  @movie_page = MoviePage.new
  @sidebar = SideBarView.new

  page.current_window.resize_to(1440, 900)
  #page.driver.browser.manage.window.maximize
  #verificar tamanho mínimo de resolução, pois algum elemento pode ficar de fora dependo de ontem for aberto.
end

Before("@login") do #gacho pra acesso na página de filme informando @login no cadastro do filme.
  user = CONFIG["users"]["cat_manager"] #vai pega users e o tipo de usuário poderia ser admin
  @login_page.go
  @login_page.with(user["email"], user["pass"])
end

After do |scenario|
  screenshot = page.save_screenshot("log/screenshots/#{scenario.__id__}.png")
  embed(screenshot, "image/png", "Screenshot")
end

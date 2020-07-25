require "pg"

class Database
  def initialize
    @connection = PG.connect(CONFIG["database"])
  end

  def delete_movie(title)
     @connection.exec("DELETE from public.movies where title = '#{title}';") #and status = '#{title}'") se precisar deletar mais coisas na query
    # (#`{title}) - chama interpolcação, uma forma de concatenar string no ruby.
    #connection.exec("DELETE from publci.movies where titel = '" + title +"';" and status = '" + status + "';") pode usar essa concatenação, 
  end

  def insert_movie(movie)
    sql_scrip = "INSERT INTO public.movies (title, status, year, release_date, created_at, updated_at)" \
                " VALUES('#{movie["title"]}', '#{movie["status"]}', '#{movie["year"]}', '#{movie["release_date"]}', current_timestamp, current_timestamp);"
    
    @connection.exec(sql_scrip)
    # (\)significa que tem uma string de duas linhas 
  end
end

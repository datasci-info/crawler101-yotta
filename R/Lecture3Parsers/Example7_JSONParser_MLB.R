library(httr)
library(magrittr)

url = "http://mlb.mlb.com/pubajax/wf/flow/stats.splayer?season=2017&sort_order=%27desc%27&sort_column=%27avg%27&stat_type=hitting&page_type=SortablePlayer&game_type=%27R%27&player_pool=QUALIFIER&season_type=ANY&sport_code=%27mlb%27&results=1000&recSP=1&recPP=50"

res = GET(url)
res

res %>% 
  content() %>% 
  # names
  .$stats_sortable_player %>% 
  # names
  .$queryResults %>% 
  # names
  .$row %>% 
  do.call(rbind, .) %>% as.data.frame()
  

df = res %>% 
  content() %>% 
  # names
  .$stats_sortable_player %>% 
  # names
  .$queryResults %>% 
  # names
  .$row %>% 
  do.call(rbind, .) %>% as.data.frame()



df %>% View

  

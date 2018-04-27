library(jsonlite)
parameter = fromJSON('fb_api_config.json')

API_TOKEN = parameter$token


library(httr)
library(magrittr)

fb_api_feed = function(who){
  sprintf("https://graph.facebook.com/v2.12/%s/feed",who)
}

fb_api_feed("me")

queryParams = list(
  fields="id,created_time,message,message_tags,story,story_tags,status_type,likes.limit(200)"
  ,limit=200
  ,access_token=API_TOKEN
)

res = GET(fb_api_feed("me"), query=queryParams)
res

res %>% 
  content() %>% 
  .$data %>% 
  .[[1]]

res %>% 
  content() %>% 
  .$data %>% 
  map(function(data) list(id=data$id, 
                          likes=data$likes$data) ) 


nlikes = res %>% 
  content() %>% 
  .$data %>% 
  map_int(function(data) length(data$likes$data))


dataIdx = which(nlikes > 0)

df = res %>% 
  content() %>% 
  .$data %>% 
  map(function(data) list(id=data$id, 
                          likes=data$likes$data) ) %>% 
  .[dataIdx] %>% 
  do.call(rbind,.) %>% 
  as.data.frame() %>% 
  mutate(pid = id,
         likes = map(likes, function(data){
    data %>% do.call(rbind,.) %>% as.data.frame()
  })) %>% 
  mutate(df=map2(pid,likes,function(pid,likes){
    likes$pid = pid
    likes
  })) %>% 
  .$df %>% 
  do.call(rbind,.)

df %>% View

df %>% names

df = df %>% 
  map(unlist) %>% 
  do.call(data.frame,.)

df %>%
  group_by(id,name) %>% 
  summarise(n=n()) %>% 
  arrange(-n)



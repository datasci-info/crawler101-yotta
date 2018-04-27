library(httr)

res = GET("http://www.319papago.idv.tw/lifeinfo/starbucks/starbucks-02.html")
resStr = content(res,as = "text",encoding="utf8")

res

# [phone number] try1:
matches = gregexpr("[0-9]+",resStr)
unlist(regmatches(resStr,matches))


# [phone number] try1:
matches = gregexpr("[(][0-9]+[)][0-9]+-[0-9]+",resStr)
unlist(regmatches(resStr,matches))


# [phone number] try2:
matches = gregexpr("[0-9]+-[0-9]+",resStr)
unlist(regmatches(resStr,matches))

# [phone number] try2:
matches = gregexpr("[0-9]{4}-[0-9]{4}",resStr)
unlist(regmatches(resStr,matches))

# [chinese character] try1:
matches = gregexpr("[\u4E00-\u9FA5]+",resStr)
unlist(regmatches(resStr,matches))

# [chinese character] try2:
matches = gregexpr("[\u4E00-\u9FA5|0-9|(|)]+",resStr)
unlist(regmatches(resStr,matches))

# [chinese character] try3:
matches = gregexpr("[\u4E00-\u9FA5]+[\u4E00-\u9FA5|0-9|(|)]+",resStr)
unlist(regmatches(resStr,matches))

# [chinese character] try4:
matches = gregexpr("台北[\u4E00-\u9FA5]+",resStr)
unlist(regmatches(resStr,matches))

# [chinese character] try5:
matches = gregexpr("台北萬華[\u4E00-\u9FA5]+",resStr)
unlist(regmatches(resStr,matches))

# [chinese character] try6:
matches = gregexpr("台北市?萬華[\u4E00-\u9FA5]+",resStr)
unlist(regmatches(resStr,matches))

# [chinese character] try7: NOT
matches = gregexpr("[^\u4E00-\u9FA5]+",resStr)
unlist(regmatches(resStr,matches))


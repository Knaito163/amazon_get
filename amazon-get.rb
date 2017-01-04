# -*- coding: utf-8 -*-
require 'amazon/ecs'
require 'pp'

Amazon::Ecs.options = {
  :associate_tag => 'ASSOCIATE_TAG', #ASSOCIATE_TAG
  :AWS_access_key_id => 'AWS_ACCESS_KEY',  #AWS_ACCESS_KEY
  :AWS_secret_key => 'AWS_SECRET_ACCESS_KEY' #AWS_SECRET_ACCESS_KEY
}


#検索したいISBN
isbn_num = "ISBN"


#商品検索
res = Amazon::Ecs.item_lookup(
  isbn_num, :response_group => 'Small,
  ItemAttributes, Images', :country => 'jp')
# pp res


# 取得->hash_objに格納
r = res.items.first
r_info = {}
#書籍名
r_info["Title"] = r.get("ItemAttributes/Title")
#ISBN
r_info["ISBN"] = r.get("ItemAttributes/ISBN")
#種類
r_info["Binding"] = r.get("ItemAttributes/Binding")
#著者
r_info["Author"] = r.get("ItemAttributes/Author")
#会社
r_info["Manufacturer"] = r.get("ItemAttributes/Manufacturer")
#グループ
r_info["ProductGroup"] = r.get("ItemAttributes/ProductGroup")
#page
r_info["NumberOfPages"] = r.get("ItemAttributes/NumberOfPages")
#Date
r_info["PublicationDate"] = r.get("ItemAttributes/PublicationDate")
# image(3種類)
r_info["Image"] = {}
r_info["Image"]["Small"] = r.get("SmallImage/URL")
r_info["Image"]["Medium"] = r.get("MediumImage/URL")
r_info["Image"]["Large"] = r.get("LargeImage/URL")


pp r_info
# pp r_info["Title"]
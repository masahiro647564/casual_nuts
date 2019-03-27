class RakutenController < ApplicationController

  def search_product
    search_rakuten_api("ナッツ")
  end
  
  def search_rakuten_api(keyword)
    items = RakutenWebService::Ichiba::Item.search(keyword: keyword, hits: 6)
    images_arr = []
    items.each do |item|
      puts item['itemName'] #商品名
      puts item['itemPrice'] #価格
      puts item['itemUrl'] #商品のURL
    end
  end
end

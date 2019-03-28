class RakutenController < ApplicationController

  def items_search
    search_rakuten_api("ナッツ")
  end
  
  def search_rakuten_api(keyword)
    @items = RakutenWebService::Ichiba::Item.search(keyword: keyword, hits: 6)
  end
end

xml.instruct!
xml.rss "version" => "2.0", "xmlns:dc" =>
"http://purl.org/dc/elements/1.1/" do
xml.channel do
xml.title @page_title
xml.description "INEPlay: Games for gamers"
xml.link url_for :action => 'index', :only_path => false
xml.language "en-us"
xml.ttl "60"

for game in @games do
xml.item do
xml.title game.name
xml.description "#{game.name} by #{game.supplier_names}"
xml.link url_for :action => "show", :id => game,
:only_path => false
xml.guid url_for :action => "show", :id => game,
:only_path => false
xml.pubDate game.created_at.to_s :long
xml.supplier game.supplier_names
end
end
end
end

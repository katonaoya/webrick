# webrick.rb
require 'webrick'
require 'date'

server = WEBrick::HTTPServer.new({ 
  :DocumentRoot => './',
  :BindAddress => '127.0.0.1',
  :Port => 8000
})

server.mount_proc("/time") do |req, res|
  # レスポンス内容を出力
  body = "<html><body>#{Time.now}</body></html>"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.mount_proc("/form_get") do |req, res|
  body = "<head>
          <meta charset='utf-8'>
          </head>
          <html><body>
          <p>クエリパラメータは#{req.query}です。</p>
          <p>こんにちは#{req.query["username"]}さん。あなたの年齢は#{req.query["userage"]}ですね。</p>
          </body></html>"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end   

server.mount_proc("/form_post") do |req, res|
  # レスポンス内容を出力
body = "<head>
          <meta charset='utf-8'>
          </head>
          <html><body>
          <p>フォームデータは#{req.query}です。</p>
          <p>こんにちは#{req.query["username"]}さん。あなたの年齢は#{req.query["userage"]}ですね。</p>
          </body></html>"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.start
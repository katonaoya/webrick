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
  body = "#{Time.now}"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.start
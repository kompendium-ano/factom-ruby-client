require 'net/http'
require 'uri'
require 'json'

class JsonRPC
  def initialize(service_url)
    @uri = URI.parse(service_url)
  end

  def call(name, args)
    post_body = { 'method' => name, 'params' => args, 'id' => 0, 'jsonrpc': '2.0' }.to_json
    resp = JSON.parse( http_post_request(post_body))
    resp
  end

  def http_post_request(post_body)
    url = URI(@uri)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request.body = post_body
    http.request(request).body
  end

  class JSONRPCError < RuntimeError; end
end
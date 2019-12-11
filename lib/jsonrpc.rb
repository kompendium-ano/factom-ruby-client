require 'net/http'
require 'uri'
require 'json'

class JsonRPC
  def initialize(service_url)
    @uri = URI.parse(service_url)
  end

  def call(name, args)
    post_body = { 'method' => name, 'params' => args, 'id' => 0, 'jsonrpc': '2.0' }.to_json
    return http_post_request(post_body, name)
  end

  def http_post_request(post_body, name)
    url = URI(@uri)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request.body = post_body
    return resp = http.request(request).body
    # resp = JSON.parse(resp)
    # if resp.has_key? 'error'
    #   if resp['error']['message']=="Method not found"
    #     resp['error']['message']="#{name} method not found. Please check your URL you provide is correct (factomd API call to factomd, wallet API call to factom-walletd API URL).";
    #     return resp
    #   else
    #     return resp
    #   end
    # else
    #   return resp
    # end
  end

  class JSONRPCError < RuntimeError; end
end
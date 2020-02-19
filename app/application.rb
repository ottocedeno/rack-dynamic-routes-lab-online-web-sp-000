require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last

      item = @@items.find {|i| i.name == item_name}
      binding.pry
      if item
        resp.write item.price
        resp.status = 200
      end
    end
    resp.write "Route not found"
    resp.status = 404
    resp.finish
  end


end

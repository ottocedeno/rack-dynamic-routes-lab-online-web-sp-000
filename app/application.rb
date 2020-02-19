require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items").last
      @@items.each do |item_obj|
        if item_obj.name == item_name
          resp.write item_obj.name
        end
      end


      binding.pry
      resp.write "I work"
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end

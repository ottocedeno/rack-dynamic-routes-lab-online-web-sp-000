require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      @@items.each do |item_obj|
        # binding.pry
        if item_obj.name == item_name
          resp.write item_obj.price
          resp.status = 200
        else
          error_404
        end
      end
    else
      error_404
    end
    resp.finish
  end

  def error_404
    resp.write "Route not found"
    resp.status = 404
  end
end

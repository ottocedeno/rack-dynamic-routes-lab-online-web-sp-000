require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last

      @@items.each do |item_obj|

        if item_obj.name == item_name
          resp.write item_obj.price
          resp.status = 200
        else
          # resp.write "Route not found"
          # resp.status = 404
        end
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end


end

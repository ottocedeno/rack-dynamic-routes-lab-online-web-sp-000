require 'pry'

class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/testing/)
      resp.write "I work"
    else
      resp.write "Route not found"
      resp.status = 404
    binding.pry
    end
  end

end

require 'json'

class Flash

  attr_reader :now

  def initialize(req)
    cookie = req.cookies["_rails_lite_app_flash"]
    if cookie
      @now = JSON.parse(cookie)
    else
      @now = {}
    end
    @cookie_hash = {}
  end

  def []=(key, val)
    @cookie_hash[key] = val
  end

  def [](key)
    @now[key.to_s] || @cookie_hash[key.to_s]
  end

  def store_flash(res)
    cookie = { path: '/', value: @cookie_hash.to_json }
    res.set_cookie("_rails_lite_app_flash", cookie)

  end

end

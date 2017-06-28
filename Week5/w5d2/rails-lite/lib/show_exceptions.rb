require 'erb'

class ShowExceptions

  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
    rescue Exception => e
    render_exception(e)
  end

  private
  #
  # def render_exception(e)
  #   res = Rack::Response.new
  #   res.status = 500
  #   res['Content-Type'] = 'text/html'
  #
  # end

  def render_exception(e)
      dir_path = File.dirname(__FILE__)
      template_fname = File.join(dir_path, "templates", "rescue.html.erb")
      template = File.read(template_fname)

      ['500', {'Content-type' => 'text/html'}, ERB.new(template).result(binding)]
  end
end

require('pg')

class Property

  def initialize(options)
    @address = options['address']
    @value = options['value']
    @build = options['build']
    @rooms = options['rooms'].to_i
  end


end

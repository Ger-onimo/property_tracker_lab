require('pg')

class Property
  attr_accessor :address, :value, :build, :rooms

  def initialize(options)
    @address = options['address']
    @value = options['value']
    @build = options['build']
    @rooms = options['rooms'].to_i
  end

  def save
    db = PG.connect({dbname:'estate_agent', host:'localhost'})
    sql = "
    INSERT INTO properties (address, value, build, rooms)
    VALUES ($1, $2, $3, $4)
    RETURNING *"
    values = [@address, @value, @build, @rooms]
    db.prepare('save', sql)
    @id = db.exec_prepared('save', values)[0]['id']
    db.close()
  end





end

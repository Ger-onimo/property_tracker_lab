require('pg')

class Property
  attr_accessor :address, :value, :build, :rooms
  attr_reader :id

  def initialize(options)
    @id = options['id'] if options['id']
    @address = options['address']
    @value = options['value']
    @build = options['build']
    @rooms = options['rooms'].to_i
  end

  def save
    db = PG.connect({dbname:'estate_agent', host:'localhost'})
    sql = "INSERT INTO properties
            (address, value, build, rooms)
           VALUES
            ($1, $2, $3, $4)
          RETURNING *"
    values = [@address, @value, @build, @rooms]
    db.prepare('save', sql)
    @id = db.exec_prepared('save', values)[0]['id']
    db.close()
  end

  def delete
    db = PG.connect({dbname:'estate_agent', host:'localhost'})
    sql = "DELETE FROM properties
          WHERE id = $1"
    values = [@id]
    db.prepare('delete', sql)
    db.exec_prepared('delete', values)
    db.close

  end

  def update
    db = PG.connect({dbname:'estate_agent', host:'localhost'})
    sql = "UPDATE properties SET
            (address, value, build, rooms) =
            ($1, $2, $3, $4)
            WHERE id = $5"
    values = [@address, @value, @build, @rooms]
    db.prepare('update', sql)
    db.exec_prepared('update', values)
    db.close()
  end

  def Property.delete_all()
    db = PG.connect({dbname:'estate_agent', host:'localhost'})
    sql = "DELETE FROM properties"
    db.prepare('delete_all', sql)
    db.exec_prepared('delete_all')
    db.close()
  end


  def Property.all()
    db = PG.connect({dbname:'estate_agent', host:'localhost'})
    sql =  "SELECT * FROM properties"
    db.prepare('all', sql)
    properties_result = db.exec_prepared('all')
    db.close()
    return properties_result.map { |prop| Property.new(prop) }
  end


end

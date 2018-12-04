require('pry')
require_relative('models/property')

Property.delete_all

property1 = Property.new( {
              'address' => '1 Main St',
              'value' => '£700',
              'build' => 'flat',
              'rooms' => '2'
                  } )

property2 = Property.new( {
                'address' => '705 Barry Pl',
                'value' => '£1500',
                'build' => 'town house',
                'rooms' => '4'
              } )

property3 = Property.new( {
                'address' => '5 Cheapo Ter',
                'value' => '£200',
                'build' => 'town house',
                'rooms' => '1'
              } )

property1.save #test for save
property2.save #test for save
property3.save

property1.delete #test for delete

properties_result = Property.all()

binding.pry
nil

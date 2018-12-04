require('pry')
require_relative('models/property')

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

binding.pry
nil

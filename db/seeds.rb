require_relative '../models/joint'
require_relative '../models/burger'
require_relative '../models/deal'

Joint.delete_all
Burger.delete_all
Deal.delete_all

joint1 = Joint.new({
  'name' => 'Nasty Burgers',
  'address' => '6 Comiston Rd',
  'url' => 'www.realnastyburgers.com'
})

joint2 = Joint.new({
  'name' => 'La Hamburguesa Salvaje',
  'address' => '34 Comiston Rd',
  'url' => 'www.salvajeburgers.com'
  })

joint1.save
joint2.save

burger1 = Burger.new({
  'name' => 'Cheese Royale',
  'stars' => '3',
  'price' => '3.99',
  'joint_id' => joint1.id.to_s
  })

burger2 = Burger.new({
  'name' => 'La Poderosa',
  'stars' => '5',
  'price' => '4.20',
  'joint_id' => joint2.id
  })

burger1.save
burger2.save

deal1 = Deal.new({
  'name' => 'Dos por uno!',
  'days' => 'Mon,Fri',
  'value' => '50',
  'burger_id' => burger2.id
  })

deal1.save

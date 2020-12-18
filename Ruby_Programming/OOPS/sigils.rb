tree_name = 'pine' # local_variables
$car_name = "Peugeot" # global_variables
@sea_name = "Black sea" # self.instance_variables

class Animal
  @@species = 'Cat' # class_variables
end

p local_variables
p global_variables.include? :$car_name
p self.instance_variables
p Animal.class_variables

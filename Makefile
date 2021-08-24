help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

graph:	## make graph shema for Classes and Modules used
	rubrowser ./lesson7/ >./lesson7/graph.html

rspec:	## rspec
	bundle exec rspec spec/

rspec-short: ## rspec one line
	bundle exec rspec --format progress spec/

menu: #run lesson4 menu
	./lesson7/main.rb

irb:	## run irb
	irb -I . -r ./lesson3/train.rb ./lesson3/station.rb ./lesson3/route.rb

train:	## irb one file
	irb . -r ./lesson7/train.rb

car:	## irb lesson6/car
	irb -I . -r ./lesson6/car.rb

test:	## irb lesson7/all
	irb -r ./lesson7/car.rb -r ./lesson7/train.rb -r ./lesson7/station.rb -r ./lesson7/route.rb

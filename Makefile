help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

graph:	## make graph shema for Classes and Modules used
	rubrowser ./lesson6/ >./lesson6/graph.html

lesson3: #run lesson3 menu
	./lesson3/run.rb

lesson4-main: ## runrun: ## main
	./lesson4/main.rb

lesson4: #run lesson4 menu
	./lesson4/mein.rb

irb:	## run irb
	irb -I . -r ./lesson3/train.rb ./lesson3/station.rb ./lesson3/route.rb

train:	## irb one file
	irb -I . -r ./lesson3/train.rb

car:	## irb lesson6/car
	irb -I . -r ./lesson6/car.rb

lesson3: #run lesson3 menu
	./lesson3/run.rb

main: ## runrun: ## main
	./lesson4/main.rb

irb:	## run irb
	irb -I . -r ./lesson3/train.rb ./lesson3/station.rb ./lesson3/route.rb

irb-t:	## irb one file
	irb -I . -r ./lesson3/train.rb

graph:	## make graph shema for Classes and Modules used
	rubrowser ./lesson5/ >./lesson5/graph.html

lesson4: #run lesson4 menu
	./lesson4/mein.rb

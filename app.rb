require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/Word')
require('./lib/Definition')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

#address redirects
get ('/add_word') do
  erb(:add_a_word)
end

get('/home') do
  erb(:index)
end

#add-word
get('/add_a_word') do
  name = params.fetch('word_name')
  definition=params.fetch('word_definition')
  new_word = Word.new({:word => name, :definition => definition})
  new_word.save_word()
  @Words = Word.all()
  erb(:index)
end

#add_definition page setup
get('/word/:id') do
  @id = params.fetch('id').to_i
  @word = Word.return_specific(@id-1).word()
  @definition = Word.return_specific(@id-1).definition()
  erb(:specific_word)

end

post('/add_definition') do
  new_definition = params.fetch("new_definition")
  id = params.fetch("current_id").to_i #fetched in a bad way
  id -= 1
  @Words = Word.all()
  @Words[id].definition().push(new_definition)
  erb(:index)
end

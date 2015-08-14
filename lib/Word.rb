##Today, I had my first "I dont know why my code doesnt work >> Now I dont know why my code works" moment.
##Force-initialized @definition as array.new, << the definition into it, now the push method works for adding definition.
##Spent like 30 minutes trying to fix this bug, fix it accidentally. So many wat's.
class Word
  @@Words = []

  attr_reader(:word, :definition)

  #initialize method
  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @definition = Array.new
    @definition << attributes.fetch(:definition)
    @id = @@Words.length().+(1)
  end

  #singleton methods
  define_singleton_method(:all) do
    @@Words
  end

  define_singleton_method(:return_specific) do |id|
    @@Words[id]
  end

  define_singleton_method(:clear) do
    @@Words = []
  end

  #regular methods
  define_method(:save_word) do
    @@Words.push(self)
  end

  define_method(:add_definition) do |definition|
    if ((definition != "") && (definition != " "))
      @definition.push(definition)
    end
  end

end

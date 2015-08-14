class Word
  @@Words = []

  attr_reader(:word, :definition)

  #initialize method
  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @definition = []
    @definition = attributes.fetch(:definition)
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

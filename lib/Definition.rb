class Definition
  #attribute reader
  #attr_reader(:definition)

  #initializes
  define_method(:initialize) do |definition| #|attributes|
    @definition = [definition]
  end

  #Singleton Methods

  #regular methods
  define_method(:add_definition) do |definition|
    self.definition.push(definition)
  end

  define_method(:definition) do
    @definition
  end
end

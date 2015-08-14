require('rspec')
require('Word')
require('Definition')

describe ('Word') do
  before() do
    Word.clear()
  end

  describe (':save_word') do
    it('creates a word object, then saves and outputs obj to confirm') do
      test_word = Word.new({:word => "bobcat", :definition => "a small North American cat species with a barred and spotted coat and a short tail."})
      test_word.save_word()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(':definition') do
    it('creates a word object, saves, then outputs definition') do
      test_word = Word.new({:word => "serval", :definition => "a slender African wildcat with long legs, large ears, and a black-spotted orange-brown coat."})
      test_word.save_word()
      expect(test_word.definition()).to(eq("a slender African wildcat with long legs, large ears, and a black-spotted orange-brown coat."))
    end
  end

  describe(':id') do
    it('creates a word and returns just its id number') do
      test_word = Word.new({:word => "bobcat", :definition => "a small North American cat species with a barred and spotted coat and a short tail."})
      test_word.save_word()
      expect(Word.return_specific(0)).to(eq(test_word))
    end
  end
end

describe("Definition") do

  describe(":definition") do
    it("returns definitions") do
      #word is experimentalism
      new_definition_1 = "fondness for experimenting or innovating"
      new_definition_2 = "doctrine or practice of relying on experimentation; empiricism"
      test_definition = Definition.new(new_definition_1)
      test_definition.add_definition(new_definition_2)
      expect(test_definition.definition()).to(eq([new_definition_1, new_definition_2 ]))
    end
  end
end

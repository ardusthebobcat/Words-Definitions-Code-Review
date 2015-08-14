require('rspec')
require('Word')

describe ('Word') do
  describe (':save_word') do
    it('creates a word object, then saves and outputs obj to confirm') do
      test_word = Word.new({:word => "bobcat", :definition => "a small North American cat species with a barred and spotted coat and a short tail."})
      test_word.save_word()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(':id') do
    it('creates a word and returns just its id number') do
      test_word = Word.new({:word => "bobcat", :definition => "a small North American cat species with a barred and spotted coat and a short tail."})
      test_word.save_word()
      expect(Word.return_specific(1)).to(eq([test_word]))
    end
  end
end

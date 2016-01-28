class WebSpellchecker < Spellchecker
def initialize()

end
	

 def known(words)
   knownwords=DictionaryWord.select("word,count").where(word:words).order(count: :desc)
puts knownwords.map{|x| x[:word]}
return knownwords.map{|x| x[:word]}
  end
end

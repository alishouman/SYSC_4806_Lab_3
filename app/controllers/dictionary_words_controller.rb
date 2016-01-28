require "#{Rails.root}/app/models/web_spellchecker.rb"
class DictionaryWordsController < ApplicationController
 
 def spellcheck
 webSpellchecker=WebSpellchecker.new
 input_word = params[:term]
puts input_word
#render :text => "we want to check the word #{input_word}"
if (not input_word.nil?)
correctArray=webSpellchecker.correct(input_word)
if(not correctArray.nil?)
hash=Hash.new
knownWord=correctArray.include? input_word
if(knownWord)
hash= {"term" => input_word, "known" => knownWord}
else
hash= {"term" => input_word, "known" => knownWord, "suggestions" =>correctArray}
end
render :json =>hash
else
render :text =>"Word doesnt exist and there is no suggestions"
  end
else
render :text =>"No word was entered .Please enter a word!"
end
end
end

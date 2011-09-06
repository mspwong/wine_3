module WhyNots
end

class WhyNots::PigLatin

  def self.translate(text)
    text.split(" ").inject("") do |memo, token|
      word = token.downcase.gsub(/[^a-z ]/, '')
      pig_latin_word = word[1, token.length] << token[0] << SUFFIX
      pig_latin_word.capitalize! if token[0] == token[0].capitalize
      punctuations = token[pig_latin_word.length-SUFFIX.length, token.length]
      pig_latin_word.chop! << punctuations << SPACE unless punctuations.empty?
      memo << pig_latin_word
    end.strip
  end

private
  ENDING = "ay"
  SPACE = " "
  SUFFIX = "ay" + SPACE

end
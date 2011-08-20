class WhyNots::PigLatin

  def self.translate(text)
    text.split(" ").inject("") do |memo, token|
      word = token.downcase.gsub(/[^a-z ]/, '')
      pig_latin_ending = "ay "
      pig_latin_word = word[1, token.length] << token.first << pig_latin_ending
      pig_latin_word.capitalize! if token.first == token.first.capitalize
      punctuations = token[pig_latin_word.length-pig_latin_ending.length, token.length]
      pig_latin_word.chop! << punctuations unless punctuations.blank?
      memo << pig_latin_word
    end.strip
  end

end
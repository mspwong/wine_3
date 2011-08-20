class WhyNots::PigLatin

  def self.translate(text)
    foo = text.split(" ").inject("") do |memo, word|
      chars = word.chars
      #chars = word.downcase.gsub(/[^a-z ]/, '').gsub(/ /, '-').chars
      pig_latin_ending = "ay "
      pig_latin_word = (word[1, word.length] << word.first << pig_latin_ending)
      pig_latin_word.capitalize! if word.first == word.first.capitalize
      #punctuations = word.chars.to_a[pig_latin_word.length-pig_latin_ending.length, word.length].to_s
      #pig_latin_word.chop! << punctuations unless punctuations.blank?
      memo << pig_latin_word
    end
    foo.strip
  end

end
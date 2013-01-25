FAVORITE_YEAR = 2013

module WhyNots
  FAVORITE_BOOK = "Purge"

  def self.favorite_year
    FAVORITE_YEAR
  end
end

module WhyNots
  class NestedVsNamespacedClass; end       # for loading in console

  FAVORITE_AUTHOR = "Sofi Oksanen"

  class NestedClass
    FAVORITE_COLOR = :white

    def self.favorite_author
      FAVORITE_AUTHOR
    end

    def self.favorite_book
      FAVORITE_BOOK
    end

    def self.favorite_year
      FAVORITE_YEAR
    end
  end
end

class WhyNots::NamespacedClass
  FAVORITE_NUMBER = 777

  def self.favorite_author
    FAVORITE_AUTHOR
  end

  def self.favorite_book
    FAVORITE_BOOK
  end

  def self.favorite_year
    FAVORITE_YEAR
  end
end
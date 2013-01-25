module WhyNots
  class NestedVsNamespacedClass; end       # for loading in console

  FAVORITE_AUTHOR = "Sofi Oksanen"

  class NestedClass
    FAVORITE_COLOR = :white

    def self.favorite_author
      FAVORITE_AUTHOR
    end

  end
end

class WhyNots::NamespacedClass
  FAVORITE_NUMBER = 777

  def self.favorite_author
    FAVORITE_AUTHOR
  end
end
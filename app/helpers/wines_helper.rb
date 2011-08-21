module WinesHelper

  def format_tags(tags)
    first = true
    tags.inject("") do |memo, t|
        if first
            first = false
            memo << t.name
        else
            memo << " | " + t.name
        end
    end
  end

end

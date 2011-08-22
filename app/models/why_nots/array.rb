class Array

  def duplicate
    visited = {}
    self.select do |e|
      visited.key?(e) ? true : (visited[e] = true) && false
    end
  end

end

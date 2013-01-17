class WineSweeper < ActionController::Caching::Sweeper
  observe Wine

  def sweep(wine)
    expire_page wines_path
    expire_page wine_path(wine)
  end

  alias_method :after_create, :sweep
  alias_method :after_update, :sweep
  alias_method :after_destroy, :sweep
end
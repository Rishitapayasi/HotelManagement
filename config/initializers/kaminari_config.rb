Kaminari.configure do |config|
   config.default_per_page = 10
  # config.max_per_page = nil
  # config.window = 4
  # config.outer_window = 0
  # config.left = 0
  # config.right = 0
  # params_on_first_page   false by default
  config.page_method_name = :page
  config.param_name = :page
end

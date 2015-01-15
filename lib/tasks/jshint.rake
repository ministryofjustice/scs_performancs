if %w[development test].include? Rails.env
  task default: 'jshint'
end

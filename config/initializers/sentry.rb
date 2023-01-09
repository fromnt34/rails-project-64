# frozen_string_literal: true

Sentry.init do |config|
  config.enabled_environments = ['production']

  config.dsn = 'https://e7e8cad88ecd4c81a8b4606778c05ece@o4504473223692288.ingest.sentry.io/4504473287262208'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  config.traces_sample_rate = 1.0
end

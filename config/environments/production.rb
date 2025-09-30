require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Force SECRET_KEY_BASE from environment variable
  config.secret_key_base = ENV['SECRET_KEY_BASE']

  # Fix CSRF and host validation issues
  config.hosts << 'srv29.mikr.us'
  config.hosts << 'srv29.mikr.us:20168'
  config.hosts << 'localhost'
  config.hosts << 'localhost:3000'

  # DISABLE CSRF for now
  config.force_ssl = false
  config.action_controller.forgery_protection_origin_check = false

  # KLUCZOWE - napraw assety i URL-e
  config.action_controller.asset_host = 'http://srv29.mikr.us:20168'
  config.action_mailer.asset_host = 'http://srv29.mikr.us:20168'
  
  # URL options dla wszystkich akcji
  config.action_controller.default_url_options = { 
    host: 'srv29.mikr.us', 
    port: 20168,
    protocol: 'http'
  }

  config.action_mailer.default_url_options = { 
    protocol: 'http', 
    host: 'srv29.mikr.us', 
    port: 20168 
  }

  # Routes URL generation
  Rails.application.config.to_prepare do
    Rails.application.routes.default_url_options = {
      host: 'srv29.mikr.us',
      port: 20168,
      protocol: 'http'
    }
  end

  # Assets configuration
  config.public_file_server.enabled = true  # FORCE TRUE
  config.assets.compile = false
  
  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :cloudinary

  # Mount Action Cable outside main process or domain.
  # config.action_cable.mount_path = nil
  # config.action_cable.url = "wss://example.com/cable"
  # config.action_cable.allowed_request_origins = [ "http://example.com", /http:\/\/example.*/ ]

  # Assume all access to the app is happening through a SSL-terminating reverse proxy.
  # Can be used together with config.force_ssl for Strict-Transport-Security and secure cookies.
  # # config.assume_ssl = true

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = false

  # Log to STDOUT by default
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Info include generic and useful information about system operation, but avoids logging too much
  # information to avoid inadvertent exposure of personally identifiable information (PII). If you
  # want to log everything, set the level to "debug".
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment).
  # config.active_job.queue_adapter = :resque
  # config.active_job.queue_name_prefix = "rozbiegana24_production"

  config.active_storage.service = :cloudinary

  # config.action_mailer.delivery_method = :letter_opener
  
  # MAIL SERVER CONFIGURATION
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address: 'poczta.o2.pl',
      port: 465,
      domain: 'o2.pl',
      user_name: 'rozbieganakruszwica@o2.pl',
      password: 'fkK_iDer8acpaJ5',
      authentication: 'plain',
      enable_starttls_auto: true
    }
    
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Enable DNS rebinding protection and other `Host` header attacks.
  # config.hosts = [
  #   "example.com",     # Allow requests from example.com
  #   /.*\.example\.com/ # Allow requests from subdomains like `www.example.com`
  # ]
  # Skip DNS rebinding protection for the default health check endpoint.
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }

  # Ustawienia URL z portem - NAPRAW TO
  config.action_controller.default_url_options = { 
    host: 'srv29.mikr.us', 
    port: 20168,
    protocol: 'http'
  }

  config.action_mailer.default_url_options = { 
    protocol: 'http', 
    host: 'srv29.mikr.us', 
    port: 20168 
  }

  # Dodaj to żeby naprawić routes URL generation
  Rails.application.config.to_prepare do
    Rails.application.routes.default_url_options = {
      host: 'srv29.mikr.us',
      port: 20168,
      protocol: 'http'
    }
  end

  # Ustawienia URL z portem dla linków
  config.action_controller.default_url_options = { 
    host: "srv29.mikr.us", 
    port: 20168 
  }

  config.action_mailer.default_url_options = { 
    protocol: "http", 
    host: "srv29.mikr.us", 
    port: 20168 
  }
end


module UrlJob
  require 'url_job/engine' if defined?(Rails)

  autoload :DeserializationError, 'url_job/deserialization_error'
  autoload :Job, 'url_job/job'
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # extend  OxyLogger::Sys
  # include OxyLogger::Helper
end

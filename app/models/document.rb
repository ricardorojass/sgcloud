class Document < ActiveRecord::Base
  enum origin: %w(interno externo)
end

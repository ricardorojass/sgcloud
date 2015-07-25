class Document < ActiveRecord::Base
  belongs_to :category
  enum origin: %w(interno externo)
end

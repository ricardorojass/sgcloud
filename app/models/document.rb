class Document < ActiveRecord::Base
  belongs_to :category
  accepts_nested_attributes_for :category, allow_destroy: true
  enum origin: %w(interno externo)
end

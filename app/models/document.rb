class Document < ActiveRecord::Base
  enum origin: %w(interno externo)
  enum categories: %w(programas procedimientos formato instructivo manual indicadores planes)
end

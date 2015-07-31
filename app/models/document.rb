class Document < ActiveRecord::Base
  belongs_to :category
  has_many :versions, :dependent => :destroy
  belongs_to :current_version, class_name: "Version"
  accepts_nested_attributes_for :current_version,
    allow_destroy: true,
    reject_if: :all_blank
  enum origin: %w(interno externo)

end

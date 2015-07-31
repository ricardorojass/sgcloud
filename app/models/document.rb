class Document < ActiveRecord::Base
  belongs_to :category
  has_many :versions, dependent: :destroy
  belongs_to :current_version, class_name: "Version",
    foreign_key: "current_version_id", dependent: :destroy
  enum origin: %w(interno externo)

  validates :code,
            :title,
            :description,
            :origin,
            :location, presence: true
end

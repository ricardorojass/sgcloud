class Version < ActiveRecord::Base
  #before_create :version_count
  belongs_to :document
  # set up "uploaded_file" field as attached_file (using Paperclip)
  has_attached_file :uploaded_file

  validates :number, presence: true
  validates_attachment_size :uploaded_file, :less_than => 10.megabytes
  validates_attachment_presence :uploaded_file
  validates_attachment_content_type :uploaded_file, :content_type =>
  [ 'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]

  def assign_number_last_version
    self.number = 1.to_s.rjust(3, '0')
  end
end

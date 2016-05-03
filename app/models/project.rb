class Project < ActiveRecord::Base
  validates_presence_of :project_title, :total_budget, :account_number

  has_many :jobs
  has_many :tasks
  has_many :items
  has_many :staffs, through: :jobs

  belongs_to :kpa_cluster
  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :items

  mount_uploader :summary_filename, AttachmentUploader 
  mount_uploader :brief_filename, AttachmentUploader

  def to_s
    "#{self.project_title}"
  end
end

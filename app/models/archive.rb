class Archive < ApplicationRecord
  belongs_to :document
  mount_uploader :archive, ArchiveUploader
end

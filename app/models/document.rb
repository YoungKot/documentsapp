# frozen_string_literal: true

class Document < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :title, :description, presence: true # Make sure the owner's name is present.
end

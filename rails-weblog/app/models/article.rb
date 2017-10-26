class Article < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    mount_uploader :portrait, PostloaderUploader
end

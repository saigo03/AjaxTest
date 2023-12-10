class Memo < ApplicationRecord
  belongs_to :folder, optional: true
end

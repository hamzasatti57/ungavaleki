class Revenue < ApplicationRecord
  after_create -> { update_amount('create') }
  after_destroy -> { update_amount('destroy') }
end

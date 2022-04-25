module Blending
  extend ActiveSupport::Concern
  included do
    after_save :make_juice, if: Proc.new { self.class.table_name == 'apples' }
    def make_juice
      Rails.logger.info "Inside Juice"
    end
  end
 end
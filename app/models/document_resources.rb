class DocumentResources < ApplicationRecord
  self.abstract_class = true
  include AppLanguages
  # include ::UserStatus

  # def self.app_languages
  #   p "In DocumentContants abstract model: " + AppLanguages::OBJECT.to_s
  #   AppLanguages::OBJECT
  # end
  APP_LANGUAGES = AppLanguages::OBJECT.freeze
  # get_user_status_by_user_id = UserStatus.method(:get_user_status_by_user_id)
end

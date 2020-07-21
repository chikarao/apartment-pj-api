require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html

  include ActionController::MimeResponds
  include Response
  include Authenticate
  include SerializableResource

  include UserStatus
  include AppLanguages

  # include CreatePdf
  # include DocumentTranslationImportantPoints
  # include DocumentTranslationImportantPointsByPage
  # include DocumentTranslationImportantPointsAll
  # include DocumentTranslationFixedTerm
  # include DocumentTranslationFixedTermByPage
  # include DocumentTranslationFixedTermAll
  # include FixedTermRentalContractBilingualAll
  # include ImportantPointsExplanationBilingualAll
  # include TemplateElementFunctions
  # include DocumentConstants
end

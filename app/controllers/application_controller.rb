require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html

  include ActionController::MimeResponds
  include Response
  include Authenticate
  include SerializableResource
end

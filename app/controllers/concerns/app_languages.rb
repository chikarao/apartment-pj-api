#!!!! AppLanguages sent to frontend from sessions_controller, action called by header in frontend 
module AppLanguages
  include DocumentConstants
  flat_for_documents = DocumentConstants::FLAT_FOR_DOCUMENTS
  # CONSTANT for fetch_translation and save and create agreement in booking
  # def important_points_explanation_translation
    # include ImportantPointsExplanationTranslation
    OBJECT = {
      :dedicatedFlushingToilet => flat_for_documents[:toilet][:choices][:dedicatedFlushingToilet],
      :dedicatedNonFlushingToilet => flat_for_documents[:toilet][:choices][:dedicatedNonFlushingToilet],
      :sharedFlushingToilet => flat_for_documents[:toilet][:choices][:sharedFlushingToilet],
      :sharedNonFlushingToilet => flat_for_documents[:toilet][:choices][:sharedNonFlushingToilet]
    };
end

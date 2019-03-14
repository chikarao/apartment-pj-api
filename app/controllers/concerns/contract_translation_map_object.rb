module ContractTranslationMapObject
  include DocumentTranslationImportantPoints
  include DocumentTranslationFixedTerm

  OBJECT = {
      "teishaku-saimuhosho" => {},
      "juyoujikou-setsumei-jp" => {},
      # "teishaku-saimuhosho-bilingual-v3-no-translation-8" => fixed_term_rental_contract_translation,
      "teishaku-saimuhosho-bilingual-v3-no-translation-11" => DocumentTranslationFixedTerm::OBJECT,
      # "juyoujikou-setsumei-bilingual-v3-no-translation-26" => important_points_explanation_translation
      "juyoujikou-setsumei-bilingual-v3-no-translation-30" => DocumentTranslationImportantPoints::OBJECT
    }
end

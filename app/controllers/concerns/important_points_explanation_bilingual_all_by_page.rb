module ImportantPointsExplanationBilingualAllbyPage

  include ImportantPointsExplanationBilingualAll
  base = ImportantPointsExplanationBilingualAll::OBJECT

  OBJECT = {

    1 => {
      document_name: base[:document_name],
      tenant_name: base[:tenant_name],
      date_year: base[:date_year],
      date_month: base[:date_month],
      date_day: base[:date_day],
      broker_company_name: base[:broker_company_name],
      broker_company_name_translation: base[:broker_company_name_translation],
      broker_representative_name: base[:broker_representative_name],
      broker_representative_name_translation: base[:broker_representative_name_translation],
      broker_address_hq: base[:broker_address_hq],
      broker_address_hq_translation: base[:broker_address_hq_translation],
      broker_registration_number: base[:broker_registration_number],
      broker_registration_date: base[:broker_registration_date],
      broker_staff_name: base[:broker_staff_name],
      broker_staff_name_translation: base[:broker_staff_name_translation],
      broker_staff_registration: base[:broker_staff_registration],
      broker_staff_address: base[:broker_staff_address],
      broker_staff_address_translation: base[:broker_staff_address_translation],
      broker_staff_phone: base[:broker_staff_phone],
      contract_work_sub_type: base[:contract_work_sub_type],
      address: base[:address],
      address_translation: base[:address_translation],
      name: base[:name],
      name_translation: base[:name_translation],
      unit: base[:unit],
      size: base[:size],
      floor_area_official: base[:floor_area_official],
      construction: base[:construction],
      construction_translation: base[:construction_translation],
      owner_name: base[:owner_name],
      owner_name_translation: base[:owner_name_translation],
      owner_address: base[:owner_address],
      owner_address_translation: base[:owner_address_translation],
    },
    2 => {
      flat_owner_name: base[:flat_owner_name],
      flat_owner_name_translation: base[:flat_owner_name_translation],
      flat_owner_address: base[:flat_owner_address],
      flat_owner_address_translation: base[:flat_owner_address_translation],
      ownership_rights: base[:ownership_rights],
      ownership_rights_translation: base[:ownership_rights_translation],
      other_rights: base[:other_rights],
      other_rights_translation: base[:other_rights_translation],
      legal_restrictions: base[:legal_restrictions],
      legal_restrictions_translation: base[:legal_restrictions_translation],
      legal_restrictions_summary: base[:legal_restrictions_summary],
      legal_restrictions_summary_translation: base[:legal_restrictions_summary_translation],
      water: base[:water],
      water_year: base[:water_year],
      water_month: base[:water_month],
      water_day: base[:water_day],
      water_scheduled: base[:water_scheduled],
      water_notes: base[:water_notes],
      water_notes_translation: base[:water_notes_translation],
      electricity: base[:electricity],
      electricity_translation: base[:electricity_translation],
      electricity_year: base[:electricity_year],
      electricity_month: base[:electricity_month],
      electricity_day: base[:electricity_day],
      electricity_scheduled: base[:electricity_scheduled],
      electricity_scheduled_translation: base[:electricity_scheduled_translation],
      electricity_notes: base[:electricity_notes],
      electricity_notes_translation: base[:electricity_notes_translation],
      gas: base[:gas],
      gas_year: base[:gas_year],
      gas_month: base[:gas_month],
      gas_day: base[:gas_day],
      gas_scheduled: base[:gas_scheduled],
      gas_notes: base[:gas_notes],
      gas_notes_translation: base[:gas_notes_translation],
      sewage: base[:sewage],
      sewage_translation: base[:sewage_translation],
      sewage_year: base[:sewage_year],
      sewage_month: base[:sewage_month],
      sewage_day: base[:sewage_day],
      sewage_scheduled: base[:sewage_scheduled],
      sewage_scheduled_translation: base[:sewage_scheduled_translation],
      sewage_notes: base[:sewage_notes],
      sewage_notes_translation: base[:sewage_notes_translation],
      building_inspection_conducted: base[:building_inspection_conducted],
      building_inspection_summary: base[:building_inspection_summary],
      building_inspection_summary_translation: base[:building_inspection_summary_translation],
    },
    3 => {
      kitchen: base[:kitchen],
      kitchen_format: base[:kitchen_format],
      kitchen_format_translation: base[:kitchen_format_translation],
      kitchen_other: base[:kitchen_other],
      kitchen_other_translation: base[:kitchen_other_translation],
      toilet: base[:toilet],
      toilet_format: base[:toilet_format],
      toilet_format_translation: base[:toilet_format_translation],
      toilet_other: base[:toilet_other],
      toilet_other_translation: base[:toilet_other_translation],
      bath_tub: base[:bath_tub],
      bath_tub_format: base[:bath_tub_format],
      bath_tub_format_translation: base[:bath_tub_format_translation],
      bath_tub_other: base[:bath_tub_other],
      bath_tub_other_translation: base[:bath_tub_other_translation],
      hot_water: base[:hot_water],
      hot_water_format: base[:hot_water_format],
      hot_water_format_translation: base[:hot_water_format_translation],
      hot_water_other: base[:hot_water_other],
      hot_water_other_translation: base[:hot_water_other_translation],
      kitchen_grill: base[:kitchen_grill],
      kitchen_grill_format: base[:kitchen_grill_format],
      kitchen_grill_format_translation: base[:kitchen_grill_format_translation],
      kitchen_grill_other: base[:kitchen_grill_other],
      kitchen_grill_other_translation: base[:kitchen_grill_other_translation],
      ac: base[:ac],
      ac_format: base[:ac_format],
      ac_format_translation: base[:ac_format_translation],
      ac_other: base[:ac_other],
      ac_other_translation: base[:ac_other_translation],
      equipment1_name: base[:equipment1_name],
      equipment1_name_translation: base[:equipment1_name_translation],
      equipment1: base[:equipment1],
      equipment1_format: base[:equipment1_format],
      equipment1_format_translation: base[:equipment1_format_translation],
      equipment1_other: base[:equipment1_other],
      equipment1_other_translation: base[:equipment1_other_translation],
      equipment2_name: base[:equipment2_name],
      equipment2_name_translation: base[:equipment2_name_translation],
      equipment2: base[:equipment2],
      equipment2_format: base[:equipment2_format],
      equipment2_format_translation: base[:equipment2_format_translation],
      equipment2_other: base[:equipment2_other],
      equipment2_other_translation: base[:equipment2_other_translation],
      inside_disaster_prevention: base[:inside_disaster_prevention],
      inside_disaster_warning: base[:inside_disaster_warning],
      inside_tsunami_warning: base[:inside_tsunami_warning],
      asbestos_record: base[:asbestos_record],
      asbestos_survey_contents: base[:asbestos_survey_contents],
      asbestos_survey_contents_translation: base[:asbestos_survey_contents_translation],
    },
    4 => {
      earthquake_study_performed: base[:earthquake_study_performed],
      earthquake_study_contents: base[:earthquake_study_contents],
      earthquake_study_contents_translation: base[:earthquake_study_contents_translation],
      other_payments1: base[:other_payments1],
      other_payments1_explanation: base[:other_payments1_explanation],
      other_payments1_explanation_translation: base[:other_payments1_explanation_translation],
      other_payments2: base[:other_payments2],
      other_payments2_explanation: base[:other_payments2_explanation],
      other_payments2_explanation_translation: base[:other_payments2_explanation_translation],
      other_payments3: base[:other_payments3],
      other_payments3_explanation: base[:other_payments3_explanation],
      other_payments3_explanation_translation: base[:other_payments3_explanation_translation],
      other_payments4: base[:other_payments4],
      other_payments4_explanation: base[:other_payments4_explanation],
      other_payments4_explanation_translation: base[:other_payments4_explanation_translation],
      contract_break_terms: base[:contract_break_terms],
      contract_break_terms_translation: base[:contract_break_terms_translation],
    },
    5 => {
      warranties: base[:warranties],
      warranties_translation: base[:warranties_translation],
      escrow_for_deposit: base[:escrow_for_deposit],
      escrow_agent_deposit: base[:escrow_agent_deposit],
      escrow_agent_deposit_translation: base[:escrow_agent_deposit_translation],
      from_year: base[:from_year],
      from_month: base[:from_month],
      from_day: base[:from_day],
      to_year: base[:to_year],
      to_month: base[:to_month],
      to_day: base[:to_day],
      contract_length_years: base[:contract_length_years],
      contract_length_months: base[:contract_length_months],
      contract_type: base[:contract_type],
      contract_renewal_terms: base[:contract_renewal_terms],
      contract_renewal_terms_translation: base[:contract_renewal_terms_translation],
    },
    6 => {
      limitations_use: base[:limitations_use],
      limitations_use_translation: base[:limitations_use_translation],
      limitations_use_other: base[:limitations_use_other],
      limitations_use_other_translation: base[:limitations_use_other_translation],
      restrictions_use: base[:restrictions_use],
      restrictions_use_translation: base[:restrictions_use_translation],
      restrictions_use_other: base[:restrictions_use_other],
      restrictions_use_other_translation: base[:restrictions_use_other_translation],
      deposit_return_terms: base[:deposit_return_terms],
      deposit_return_terms_translation: base[:deposit_return_terms_translation],
      building_management_company: base[:building_management_company],
      building_management_company_translation: base[:building_management_company_translation],
      building_management_registration: base[:building_management_registration],
      building_management_address: base[:building_management_address],
      building_management_address_translation: base[:building_management_address_translation],
    },
    7 => {
      bond_deposit_office: base[:bond_deposit_office],
      bond_deposit_office_translation: base[:bond_deposit_office_translation],
      bond_deposit_office_address: base[:bond_deposit_office_address],
      bond_deposit_office_address_translation: base[:bond_deposit_office_address_translation],
      guaranty_association_name: base[:guaranty_association_name],
      guaranty_association_name_translation: base[:guaranty_association_name_translation],
      guaranty_association_address: base[:guaranty_association_address],
      guaranty_association_address_translation: base[:guaranty_association_address_translation],
      guaranty_association_office_address: base[:guaranty_association_office_address],
      guaranty_association_office_address_translation: base[:guaranty_association_office_address_translation],
      bond_deposit_office_1: base[:bond_deposit_office_1],
      bond_deposit_office_1_translation: base[:bond_deposit_office_1_translation],
      bond_deposit_office_address_1: base[:bond_deposit_office_address_1],
      bond_deposit_office_address_1_translation: base[:bond_deposit_office_address_1_translation],
    },
    8 => {
      date_prepared: base[:date_prepared],
      building_name_1: base[:building_name_1],
      building_name_1_translation: base[:building_name_1_translation],
      address_1: base[:address_1],
      address_1_translation: base[:address_1_translation],
      address_check: base[:address_check],
      address_site_check: base[:address_site_check],
      building_name_2: base[:building_name_2],
      building_name_2_translation: base[:building_name_2_translation],
      unit_1: base[:unit_1],
      construction_1: base[:construction_1],
      floors: base[:floors],
      floors_underground: base[:floors_underground],
      size_1: base[:size_1],
      inspection_date: base[:inspection_date],
      flat_type: base[:flat_type],
      flat_sub_type: base[:flat_sub_type],
      degradation_exists_wooden: base[:degradation_exists_wooden],
      foundation: base[:foundation],
      floor_assembly: base[:floor_assembly],
      floor: base[:floor],
      pillars: base[:pillars],
      exterior_walls: base[:exterior_walls],
      balcony: base[:balcony],
      interior_walls: base[:interior_walls],
      ceilings: base[:ceilings],
      roof_truss: base[:roof_truss],
      termite_damage: base[:termite_damage],
      corrosion: base[:corrosion],
      reinforcement: base[:reinforcement],
      concrete_compression: base[:concrete_compression],
      exterior_walls_rain: base[:exterior_walls_rain],
      eaves_rain: base[:eaves_rain],
      balcony_rain: base[:balcony_rain],
      interior_walls_rain: base[:interior_walls_rain],
      ceilings_rain: base[:ceilings_rain],
      roof_truss_rain: base[:roof_truss_rain],
      roof: base[:roof],
    },
    9 => {
      inspector_name: base[:inspector_name],
      inspector_name_translation: base[:inspector_name_translation],
      inspector_trainer: base[:inspector_trainer],
      inspector_trainer_translation: base[:inspector_trainer_translation],
      inspector_certificate_number: base[:inspector_certificate_number],
      architect_qualification_type: base[:architect_qualification_type],
      architect_type: base[:architect_type],
      architect_registration_number: base[:architect_registration_number],
      architect_registration_jurisdiction: base[:architect_registration_jurisdiction],
      architect_registration_jurisdiction_translation: base[:architect_registration_jurisdiction_translation],
      architect_office_name: base[:architect_office_name],
      architect_office_name_translation: base[:architect_office_name_translation],
      architect_office_registration_jurisdiction: base[:architect_office_registration_jurisdiction],
      architect_office_registration_jurisdiction_translation: base[:architect_office_registration_jurisdiction_translation],
      architect_office_registration: base[:architect_office_registration],
    },
    10 => {
      date_prepared_1: base[:date_prepared_1],
      building_name_3: base[:building_name_3],
      building_name_3_translation: base[:building_name_3_translation],
      address_2: base[:address_2],
      address_2_translation: base[:address_2_translation],
      address_check_1: base[:address_check_1],
      address_site_check_1: base[:address_site_check_1],
      building_name_4: base[:building_name_4],
      building_name_4_translation: base[:building_name_4_translation],
      unit_2: base[:unit_2],
      construction_2: base[:construction_2],
      floors_1: base[:floors_1],
      floors_underground_1: base[:floors_underground_1],
      size_2: base[:size_2],
      inspection_date_1: base[:inspection_date_1],
      flat_type_1: base[:flat_type_1],
      flat_sub_type_1: base[:flat_sub_type_1],
      degradation_exists_concrete: base[:degradation_exists_concrete],
      foundation_1: base[:foundation_1],
      floor_1: base[:floor_1],
      pillars_1: base[:pillars_1],
      exterior_walls_1: base[:exterior_walls_1],
      balcony_1: base[:balcony_1],
      halls: base[:halls],
      interior_walls_1: base[:interior_walls_1],
      ceilings_1: base[:ceilings_1],
      reinforcement_1: base[:reinforcement_1],
      concrete_compression_1: base[:concrete_compression_1],
      exterior_walls_rain_1: base[:exterior_walls_rain_1],
      interior_walls_rain_1: base[:interior_walls_rain_1],
      ceilings_rain_1: base[:ceilings_rain_1],
      roof_1: base[:roof_1],
  },
    11 => {
      inspector_name_1: base[:inspector_name_1],
      inspector_name_1_translation: base[:inspector_name_1_translation],
      inspector_trainer_1: base[:inspector_trainer_1],
      inspector_trainer_1_translation: base[:inspector_trainer_1_translation],
      inspector_certificate_number_1: base[:inspector_certificate_number_1],
      architect_qualification_type_1: base[:architect_qualification_type_1],
      architect_type_1: base[:architect_type_1],
      architect_registration_number_1: base[:architect_registration_number_1],
      architect_registration_jurisdiction_1: base[:architect_registration_jurisdiction_1],
      architect_registration_jurisdiction_1_translation: base[:architect_registration_jurisdiction_1_translation],
      architect_office_name_1: base[:architect_office_name_1],
      architect_office_name_1_translation: base[:architect_office_name_1_translation],
      architect_office_registration_jurisdiction_1: base[:architect_office_registration_jurisdiction_1],
      architect_office_registration_jurisdiction_1_translation: base[:architect_office_registration_jurisdiction_1_translation],
      architect_office_registration_1: base[:architect_office_registration_1],
    },
  }

end

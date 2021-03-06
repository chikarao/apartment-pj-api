module FixedTermRentalContractBilingualAllbyPage
  
  include FixedTermRentalContractBilingualAll
  base = FixedTermRentalContractBilingualAll::OBJECT

  OBJECT = {

    1 => {
      document_name: base[:document_name],
      name: base[:name],
      name_translation: base[:name_translation],
      address: base[:address],
      address_translation: base[:address_translation],
      flat_type: base[:flat_type],
      construction: base[:construction],
      floors: base[:floors],
      year_built: base[:year_built],
      units: base[:units],
      last_renovation_year: base[:last_renovation_year],
      unit: base[:unit],
      rooms: base[:rooms],
      layout: base[:layout],
      size: base[:size],
      balcony_size: base[:balcony_size],
      toilet: base[:toilet],
      bath_tub: base[:bath_tub],
      shower: base[:shower],
      wash_basin: base[:wash_basin],
      washer_dryer_area: base[:washer_dryer_area],
      hot_water: base[:hot_water],
      kitchen_grill: base[:kitchen_grill],
      parcel_delivery_box: base[:parcel_delivery_box],
      ac: base[:ac],
      lighting_fixed: base[:lighting_fixed],
      auto_lock: base[:auto_lock],
      cable_tv: base[:cable_tv],
      internet_ready: base[:internet_ready],
      mail_box: base[:mail_box],
      lock_key: base[:lock_key],
      key_number: base[:key_number],
      keys: base[:keys],
      power_usage_amount: base[:power_usage_amount],
      gas: base[:gas],
      water: base[:water],
      sewage: base[:sewage],
    }, # end of 1
    2 => {
      parking_included: base[:parking_included],
      parking_spaces: base[:parking_spaces],
      parking_space_number: base[:parking_space_number],
      bicycle_parking_included: base[:bicycle_parking_included],
      bicycle_parking_spaces: base[:bicycle_parking_spaces],
      bicycle_parking_space_number: base[:bicycle_parking_space_number],
      motorcycle_parking_included: base[:motorcycle_parking_included],
      motorcycle_parking_spaces: base[:motorcycle_parking_spaces],
      motorcycle_parking_space_number: base[:motorcycle_parking_space_number],
      storage_included: base[:storage_included],
      storage_spaces: base[:storage_spaces],
      storage_space_number: base[:storage_space_number],
      dedicated_yard: base[:dedicated_yard],
      other_facility: base[:other_facility],
      other_facility_name: base[:other_facility_name],
      from_year: base[:from_year],
      from_month: base[:from_month],
      from_day: base[:from_day],
      to_year: base[:to_year],
      to_month: base[:to_month],
      to_day: base[:to_day],
      contract_length_years: base[:contract_length_years],
      contract_length_months: base[:contract_length_months],
      notice_from_year: base[:notice_from_year],
      notice_from_month: base[:notice_from_month],
      notice_from_day: base[:notice_from_day],
      notice_to_year: base[:notice_to_year],
      notice_to_month: base[:notice_to_month],
      notice_to_day: base[:notice_to_day],
      final_rent: base[:final_rent],
      payment_due_date: base[:payment_due_date],
      management_fees: base[:management_fees],
      fees_payment_due_date: base[:fees_payment_due_date],
      bank_name: base[:bank_name],
      bank_name_english: base[:bank_name_english],
      account_type: base[:account_type],
      account_number: base[:account_number],
      swift: base[:swift],
      account_name: base[:account_name],
      account_name_english: base[:account_name_english],
      transfer_fee_paid_by: base[:transfer_fee_paid_by],
      rent_payment_method: base[:rent_payment_method],
      final_deposit: base[:final_deposit],
      deposit_amount: base[:deposit_amount],
      facilities_usage_fee: base[:facilities_usage_fee],
      other_fees: base[:other_fees],
    },
    3 => {
      owner_address: base[:owner_address],
      owner_address_translation: base[:owner_address_translation],
      owner_company: base[:owner_company],
      owner_company_translation: base[:owner_company_translation],
      owner_name: base[:owner_name],
      owner_name_translation: base[:owner_name_translation],
      owner_phone: base[:owner_phone],
      management_address: base[:management_address],
      management_address_translation: base[:management_address_translation],
      management_company: base[:management_company],
      management_company_translation: base[:management_company_translation],
      management_name: base[:management_name],
      management_name_translation: base[:management_name_translation],
      management_phone: base[:management_phone],
      management_registration_number_front: base[:management_registration_number_front],
      management_registration_number: base[:management_registration_number],
      flat_owner_address: base[:flat_owner_address],
      flat_owner_address_translation: base[:flat_owner_address_translation],
      flat_owner_company: base[:flat_owner_company],
      flat_owner_company_translation: base[:flat_owner_company_translation],
      flat_owner_name: base[:flat_owner_name],
      flat_owner_name_translation: base[:flat_owner_name_translation],
      flat_owner_phone: base[:flat_owner_phone],
      tenant_name: base[:tenant_name],
      tenant_age: base[:tenant_age],
      tenant_phone: base[:tenant_phone],
      co_tenant_name: base[:co_tenant_name],
      co_tenant_age: base[:co_tenant_age],
      co_tenant_name_1: base[:co_tenant_name_1],
      co_tenant_age_1: base[:co_tenant_age_1],
      co_tenant_name_2: base[:co_tenant_name_2],
      co_tenant_age_2: base[:co_tenant_age_2],
      co_tenants: base[:co_tenants],
      emergency_contact_address: base[:emergency_contact_address],
      emergency_contact_name: base[:emergency_contact_name],
      emergency_contact_phone: base[:emergency_contact_phone],
      emergency_contact_relationship: base[:emergency_contact_relationship],
      guarantor_address: base[:guarantor_address],
      guarantor_address_translation: base[:guarantor_address_translation],
      guarantor_name: base[:guarantor_name],
      guarantor_name_translation: base[:guarantor_name_translation],
      guarantor_phone: base[:guarantor_phone],
      guarantor_type: base[:guarantor_type],
      guarantor_registration: base[:guarantor_registration],
    },
    12 => {
      contract_year: base[:contract_year],
      contract_month: base[:contract_month],
      contract_day: base[:contract_day],
      owner_address_1: base[:owner_address_1],
      owner_address_translation_1: base[:owner_address_translation_1],
      owner_name_1: base[:owner_name_1],
      owner_name_translation_1: base[:owner_name_translation_1],
      owner_phone_1: base[:owner_phone_1],
      tenant_address: base[:tenant_address],
      tenant_name_1: base[:tenant_name_1],
      tenant_phone_1: base[:tenant_phone_1],
      broker_registration_jurisdiction: base[:broker_registration_jurisdiction],
      broker_registration_jurisdiction_translation: base[:broker_registration_jurisdiction_translation],
      broker_registration_grantor: base[:broker_registration_grantor],
      broker_registration_front_number: base[:broker_registration_front_number],
      broker_registration_number: base[:broker_registration_number],
      broker_address_hq: base[:broker_address_hq],
      broker_address_hq_translation: base[:broker_address_hq_translation],
      broker_company_name: base[:broker_company_name],
      broker_company_name_translation: base[:broker_company_name_translation],
      broker_representative_name: base[:broker_representative_name],
      broker_representative_name_translation: base[:broker_representative_name_translation],
      broker_staff_registration_jurisdiction: base[:broker_staff_registration_jurisdiction],
      broker_staff_registration_jurisdiction_translation: base[:broker_staff_registration_jurisdiction_translation],
      broker_staff_registration: base[:broker_staff_registration],
      broker_staff_name: base[:broker_staff_name],
      broker_staff_name_translation: base[:broker_staff_name_translation],
    }
  }

end

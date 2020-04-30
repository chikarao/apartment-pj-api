#!!!! IMORTANT: Need to get constants: Building, Amenities etc for selectChoices
# require Amenities::AMENITIES
module ImportantPointsExplanationBilingualAll
  include DocumentConstants
  include DocumentTranslationImportantPointsAll
  amenities = DocumentConstants::AMENITIES
  building = DocumentConstants::BUILDING
  flat_for_documents = DocumentConstants::FLAT_FOR_DOCUMENTS
  translation = DocumentTranslationImportantPointsAll::OBJECT

  # p "in module ImportantPointsExplanationBilingualAll amenities: " + amenities.to_s
  # p "in module ImportantPointsExplanationBilingualAll amenities[:kitchen]: " + amenities[:kitchen].to_s
  # p "in module ImportantPointsExplanationBilingualAll amenities, Amenties::AMENITIES: " + amenities.to_s + ' ' + Amenities::AMENITIES.to_s
  # CONSTANT for fetch_translation and save and create agreement in booking
  # def important_points_explanation_translation
    # include ImportantPointsExplanationTranslation
    OBJECT =
    {
      document_name: {
      name: 'document_name',
      # className: 'form-control-document',
      # !!!! Not a field to be rendered on pdf; Attribute of agreement record
      component: 'DocumentChoices',
      borderColor: 'lightgray',
      choices: {
        0 => {
          params: {
            val: 'documentAttributes',
            top: '2%',
            left: '32%',
            width: '40%',
            # change from input componnet use document-rectange
            class_name: 'document-rectangle',
            # !!! height works only with px
            input_type: 'string',
          }
        }
      },
      required: true,
      # translation_key: 'documentTitle',
      # category: 'document'
    },

    tenant_name: {
      name: 'tenant_name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '10.2%', left: '13.3%', width: '29.5%', height: '1.6%', text_align: 'right', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'name',
      category: 'tenant'
    },

    date_year: {
      name: 'date_year',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '10.2%', left: '64.4%', width: '5.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'year',
      category: 'document',
      group: 'documentDate'
    },

    date_month: {
      name: 'date_month',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '10.2%', left: '75.4%', width: '4.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'month',
      category: 'document',
      group: 'documentDate'
    },

    date_day: {
      name: 'date_day',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '10.2%', left: '86.4%', width: '4.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'day',
      category: 'document',
      group: 'documentDate'
    },

    broker_company_name: {
      name: 'broker_company_name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '23.5%', left: '20.4%', width: '40%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'companyName',
      category: 'broker',
      translation_field: 'broker_company_name_translation'
    },

    broker_company_name_translation: {
      name: 'broker_company_name_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '25.7%', left: '20.4%', width: '40%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'companyName',
      category: 'broker',
      #translation_object means it is a translation for template_element_object
      translation_object: true
    },

    broker_representative_name: {
      name: 'broker_representative_name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '28.1%', left: '20.4%', width: '40%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'nameOfRepresentative',
      category: 'broker',
      translation_field: 'broker_representative_name_translation'
    },

    broker_representative_name_translation: {
      name: 'broker_representative_name_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '30.3%', left: '20.4%', width: '40%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'nameOfRepresentative',
      category: 'broker',
      translation_object: true
    },

    broker_address_hq: {
      name: 'broker_address_hq',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '33.1%', left: '20.4%', width: '60%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'mainOffice',
      category: 'broker',
      translation_field: 'broker_address_hq_translation'
    },

    broker_address_hq_translation: {
      name: 'broker_address_hq_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '35.1%', left: '20.4%', width: '60%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'mainOffice',
      category: 'broker',
      translation_object: true
    },

    broker_registration_number: {
      name: 'broker_registration_number',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '37.7%', left: '20.4%', width: '30%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'licensedNumber',
      category: 'broker'
    },

    broker_registration_date: {
      name: 'broker_registration_date',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '40.7%', left: '20.4%', width: '30%', class_name: 'document-rectangle', input_type: 'date' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'dateLicensed',
      category: 'broker'
    },

    broker_staff_name: {
      name: 'broker_staff_name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '45.1%', left: '46.9%', width: '35%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'nameAgent',
      category: 'broker',
      group: 'brokerStaff',
      translation_field: 'broker_staff_name_translation'
    },

    broker_staff_name_translation: {
      name: 'broker_staff_name_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '47%', left: '46.9%', width: '35%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'nameAgent',
      category: 'broker',
      translation_object: true,
      group: 'brokerStaff'
    },

    broker_staff_registration: {
      name: 'broker_staff_registration',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '49.4%', left: '62.8%', width: '13%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'registrationNumberAgent',
      category: 'broker',
      group: 'brokerStaff'
    },

    broker_staff_address: {
      name: 'broker_staff_address',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '54.2%', left: '46.6%', width: '45.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'officeAddress',
      category: 'broker',
      group: 'brokerStaff',
      translation_field: 'broker_staff_address_translation'
    },

    broker_staff_address_translation: {
      name: 'broker_staff_address_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '56.6%', left: '46.6%', width: '45.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'officeAddress',
      category: 'broker',
      translation_object: true,
      group: 'brokerStaff'
    },

    broker_staff_phone: {
      name: 'broker_staff_phone',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '59.9%', left: '68.4%', width: '20.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'phone',
      category: 'broker',
      group: 'brokerStaff'
    },

    contract_work_sub_type: {
      name: 'contract_work_sub_type',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'representative', top: '63.9%', left: '60.5%', width: '7%', class_name: 'document-rectangle', input_type: 'button' },
              translation: translation[:representative][:translations] },
        1 => { params: { val: 'broker', top: '63.9%', left: '76%', width: '7%', class_name: 'document-rectangle', input_type: 'button' },
              translation: translation[:agent][:translations] }
        # 2 => { params: { val: 'single_family', top: '25.8%', left: '27%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } },
        # 3 => { params: { val: 'others', top: '27.3%', left: '27%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      # box: { style: { display: 'flex', flexDirection: 'column', justifyContent: 'center' } },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      translation_key: 'contractWorkSubType',
      category: 'broker',
      # translationInChoices: true
    },

    address: {
      name: 'address',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '73.1%', left: '29%', width: '63%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_record: 'flat_languages',
      # name is the column in model building language
      # translation_column: 'address_translation',
      # translation field is the field in the document that takes the translation
      translation_field: 'address_translation',
      translation_key: 'addressBuilding',
      category: 'building'
      # translation_field: 'address_translation'
    },

    address_translation: {
      name: 'address_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '75.1%', left: '29%', width: '63%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'addressBuilding',
      category: 'building',
      translation_object: true
    },
    # name is building name
    name: {
      name: 'name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '68.5%', left: '29%', width: '63%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_record: 'building_languages',
      # name is the column in model building language
      translation_column: 'name',
      # translation field is the field in the document that takes the translation
      translation_field: 'name_translation',
      translation_key: 'nameBuilding',
      category: 'building'
      # translation_sibling: 'name_translation'
    },

    name_translation: {
      name: 'name_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '70.7%', left: '29%', width: '63%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'nameBuilding',
      category: 'building',
      translation_object: true
    },

    unit: {
      name: 'unit',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '77.6%', left: '29%', width: '10%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'unit',
      category: 'flat'
    },

    size: {
      name: 'size',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '80.5%', left: '29%', width: '10%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'floorArea',
      category: 'flat'
    },

    floor_area_official: {
      name: 'floor_area_official',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '79.9%', left: '74%', width: '10%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'floorAreaOnRecord',
      category: 'flat'
    },

    construction: {
      name: 'construction',
      input_type: 'string',
      # baseLanguageField indicates this field corresponds to
      # base language of the document in constants/documents.js
      choices: {
        0 => { params: {
          val: 'inputFieldValue',
          top: '83.2%',
          left: '29%',
          width: '40.5%',
          height: '2%',
          class_name: 'document-rectangle',
          input_type: 'string' },
          selectChoices: building[:construction][:choices],
          showLocalLanguage: true,
          baseLanguageField: true
        },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_record: 'building_languages',
      # name is the column in model building language
      translation_column: 'construction',
      # translation field is the field in the document that takes the translation
      translation_field: 'construction_translation',
      # if only base record building keeps this data
      language_independent: true,
      translation_key: 'construction',
      category: 'building',
      group: 'construction'
      # translation_sibling: 'construction_translation'
    },

    construction_translation: {
      name: 'construction_translation',
      input_type: 'string',
      choices: {
        0 => { params: {
          val: 'inputFieldValue',
          top: '85.2%',
          left: '29%',
          width: '40.5%',
          height: '2%',
          class_name: 'document-rectangle',
          input_type: 'string' },
          selectChoices: building[:construction][:choices],
          # selectChoices: Building.construction.choices,
          showLocalLanguage: true
        },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'construction',
      category: 'building',
      translation_object: true,
      group: 'construction'
    },

    owner_name: {
      name: 'owner_name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '88.5%', left: '29%', width: '29.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'landlordName',
      category: 'landlord',
      translation_field: 'owner_name_translation'
    },

    owner_name_translation: {
      name: 'owner_name_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '90.5%', left: '29%', width: '29.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'landlordName',
      category: 'landlord',
      translation_object: true
    },

    owner_address: {
      name: 'owner_address',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '94%', left: '29%', width: '63%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'landlordAddress',
      category: 'landlord',
      translation_field: 'owner_address_translation'
    },

    owner_address_translation: {
      name: 'owner_address_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '96%', left: '29%', width: '63%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'landlordAddress',
      category: 'landlord',
      translation_object: true
    },
  #
  # },
  # 2 => {
    # not using building owner; corresponds to flat owner_name
    flat_owner_name: {
      name: 'flat_owner_name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '27.2%', left: '15.4%', width: '32.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_record: 'flat_languages',
      translation_column: 'owner_contact_name',
      translation_field: 'flat_owner_name_translation',
      translation_key: 'name',
      category: 'owner'
      # translation_sibling: 'flat_owner_name_translation'
    },

    flat_owner_name_translation: {
      name: 'flat_owner_name_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '29.1%', left: '15.4%', width: '32.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'name',
      category: 'owner',
      translation_object: true
    },

    # not using building owner; corresponds to flat owner_address
    flat_owner_address: {
      name: 'flat_owner_address',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '31.3%', left: '15.5%', width: '32.5%', height: '3.6%', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_record: 'flat_languages',
      translation_column: 'owner_address',
      translation_field: 'flat_owner_address_translation',
      translation_key: 'address',
      category: 'owner'
      # translation_sibling: 'flat_owner_address_translation'
    },

    flat_owner_address_translation: {
      name: 'flat_owner_address_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '34.8%', left: '15.5%', width: '32.5%', height: '3.6%', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'address',
      category: 'owner',
      translation_object: true
    },

    # building_owner_address2 => {
    #   name: 'building_owner_address2',
    #   input_type: 'string',
    #   choices: {
    #     0 => { params: { val: 'inputFieldValue', top: '86.9%', left: '22.4%', width: '27%', class_name: 'document-rectangle', input_type: 'string' } },
    #   },
    #   className: 'form-control-document',
    #   component: 'DocumentChoices'
    # },

    ownership_rights: {
      name: 'ownership_rights',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '27%', left: '49%', width: '18%', height: '5.9%', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_record: 'flat_languages',
      translation_column: 'ownership_rights',
      translation_field: 'ownership_rights_translation',
      translation_key: 'ownershipRights',
      category: 'owner'
      # translation_sibling: 'ownership_rights_translation'
    },

    ownership_rights_translation: {
      name: 'ownership_rights_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '32.5%', left: '49%', width: '18%', height: '5.9%', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'ownershipRights',
      category: 'owner',
      translation_object: true
    },

    other_rights: {
      name: 'other_rights',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '27%', left: '69%', width: '21.8%', height: '5.9%', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 60,
      translation_record: 'flat_languages',
      translation_column: 'other_rights',
      translation_field: 'other_rights_translation',
      translation_key: 'otherOwnershipRights',
      category: 'owner'
      # translation_sibling: 'other_rights_translation'
    },

    other_rights_translation: {
      name: 'other_rights_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '32.5%', left: '69%', width: '21.8%', height: '5.9%', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 60,
      translation_key: 'otherOwnershipRights',
      category: 'owner',
      translation_object: true
    },

    legal_restrictions: {
      name: 'legal_restrictions',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '44.3%', left: '20%', width: '69.8%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 70,
      translation_record: 'building_languages',
      # name is the column in model building language
      translation_column: 'legal_restrictions',
      # translation field is the field in the document that takes the translation
      translation_field: 'legal_restrictions_translation',
      translation_key: 'mainLegal',
      category: 'building'
      # translation_sibling: 'legal_restrictions_translation'
    },

    legal_restrictions_translation: {
      name: 'legal_restrictions_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '46.8%', left: '20%', width: '69.8%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 70,
      translation_key: 'mainLegal',
      category: 'building',
      translation_object: true
    },

    legal_restrictions_summary: {
      name: 'legal_restrictions_summary',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '49.2%', left: '26%', width: '65.5%', height: '3.4%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 120,
      translation_record: 'building_languages',
      # name is the column in model building language
      translation_column: 'legal_restrictions_summary',
      # translation field is the field in the document that takes the translation
      translation_field: 'legal_restrictions_summary_translation',
      translation_key: 'summaryOfRestrictions',
      category: 'building'
      # translation_sibling: 'legal_restrictions_summary_translation'
    },

    legal_restrictions_summary_translation: {
      name: 'legal_restrictions_summary_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '52.7%', left: '26%', width: '65.5%', height: '3.4%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 120,
      translation_key: 'summaryOfRestrictions',
      category: 'building',
      translation_object: true
    },

    water: {
      name: 'water',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'Public Water', top: '66.7%', left: '17.3%', width: '5.5%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: [], value: '' },
              translation: translation[:publicWater][:translations] },
        1 => { params: { val: 'Tank', top: '66.7%', left: '23.3%', width: '6.5%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: [], value: '' },
              translation: translation[:tank][:translations] },
        2 => { params: { val: 'Well', top: '66.7%', left: '30%', width: '5%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: [], value: '' },
              translation: translation[:wellWater][:translations]},
      },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      # borderColor: 'blue'
      second_click_off: true,
      translation_key: 'water',
      category: 'building'
    },

    water_year: {
      name: 'water_year',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '66.7%', left: '36%', width: '4.9%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'yearWater',
      category: 'building',
      group: 'waterDate'
    },

    water_month: {
      name: 'water_month',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '66.7%', left: '43%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'monthWater',
      category: 'building',
      group: 'waterDate'
    },

    water_day: {
      name: 'water_day',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '66.7%', left: '48.6%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'dayWater',
      category: 'building',
      group: 'waterDate'
    },

    water_scheduled: {
      name: 'water_scheduled',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'Public Water', top: '66.7%', left: '52.9%', width: '5.5%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: [], value: '' },
               translation: translation[:publicWater][:translations]},
        1 => { params: { val: 'Private Water', top: '66.7%', left: '58.4%', width: '6.5%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: [], value: '' },
               translation: translation[:tank][:translations]},
        2 => { params: { val: 'Well', top: '66.7%', left: '65.3%', width: '5%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: [], value: '' },
               translation: translation[:wellWater][:translations]},
      },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      # if click on active button, turn off active in case user mistakenly clicks
      # and attribute is not required such as with water.
      second_click_off: true,
      # borderColor: 'blue'
      translation_key: 'waterScheduled',
      category: 'building',
    },

    water_notes: {
      name: 'water_notes',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '66.5%', left: '71.2%', width: '20.5%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 40,
      translation_key: 'waterNotes',
      category: 'building',
      translation_field: 'water_notes_translation'

    },

    water_notes_translation: {
      name: 'water_notes_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '67.8%', left: '71.2%', width: '20.5%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 40,
      translation_key: 'waterNotes',
      category: 'building',
      translation_object: true
    },

    electricity: {
      name: 'electricity',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '69.6%', left: '17.3%', width: '17.7%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # translation_record: 'building_languages',
      # # # name is the column in model building language
      # translation_column: 'electricity',
      # # # translation field is the field in the document that takes the translation
      # translation_field: 'electricity_translation',
      translation_key: 'electricity',
      category: 'building'
      # translation_sibling: 'electricity_translation'
    },

    electricity_translation: {
      name: 'electricity_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '70.9%', left: '17.3%', width: '17.7%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'electricity',
      category: 'building',
      translation_object: true
    },

    electricity_year: {
      name: 'electricity_year',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '69.6%', left: '36%', width: '4.9%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'yearElectricity',
      category: 'building',
      group: 'electricityDate'
    },

    electricity_month: {
      name: 'electricity_month',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '69.6%', left: '43%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'monthElectricity',
      category: 'building',
      group: 'electricityDate'
    },

    electricity_day: {
      name: 'electricity_day',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '69.6%', left: '48.6%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'dayElectricity',
      category: 'building',
      group: 'electricityDate'
    },

    electricity_scheduled: {
      name: 'electricity_scheduled',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '69.6%', left: '53.5%', width: '17.3%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 40,
      translation_key: 'electricityScheduled',
      category: 'building',
      translation_field: 'electricity_scheduled_translation'
    },

    electricity_scheduled_translation: {
      name: 'electricity_scheduled_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '70.9%', left: '53.5%', width: '17.3%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 40,
      translation_key: 'electricityScheduled',
      category: 'building',
      translation_object: true
    },

    electricity_notes: {
      name: 'electricity_notes',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '69.6%', left: '71.2%', width: '20.5%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 40,
      translation_key: 'electricityNotes',
      category: 'building',
      translation_field: 'electricity_notes_translation'
    },

    electricity_notes_translation: {
      name: 'electricity_notes_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '70.9%', left: '71.2%', width: '20.5%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 40,
      translation_key: 'electricityNotes',
      category: 'building',
      translation_object: true
    },

    gas: {
      name: 'gas',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'Public Gas', top: '72.9%', left: '19%', width: '5.5%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: [], value: '' },
              translation: translation[:cityGas][:translations]},
        1 => { params: { val: 'Propane Gas', top: '72.9%', left: '25.2%', width: '7.6%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: [], value: '' },
              translation: translation[:propaneGas][:translations]},
        # 1 => { params: { val: 'inputFieldValue', top: '24%', left: '54.5%', width: '10%', class_name: 'document-rectangle', input_type: 'string', textAlign: 'right' } }

        # 2 => { params: { val: 'None', top: '24.95%', left: '64.4%', width: '4%', class_name: 'document-rectangle', input_type: 'button' } },
      },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      second_click_off: true,
      translation_key: 'gas',
      category: 'building'
      # borderColor: 'blue',
    },

    gas_year: {
      name: 'gas_year',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '72.9%', left: '36%', width: '4.9%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'yearGas',
      category: 'building',
      group: 'gasDate'
    },

    gas_month: {
      name: 'gas_month',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '72.9%', left: '43%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'monthGas',
      category: 'building',
      group: 'gasDate'
    },

    gas_day: {
      name: 'gas_day',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '72.9%', left: '48.6%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'dayGas',
      category: 'building',
      group: 'gasDate'
    },

    gas_scheduled: {
      name: 'gas_scheduled',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'Public Gas', top: '72.9%', left: '53.1%', width: '5.5%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: [], value: '' },
               translation: translation[:cityGas][:translations] },
        1 => { params: { val: 'Propane Gas', top: '72.9%', left: '59%', width: '7.6%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: [], value: '' },
               translation: translation[:propaneGas][:translations] },
        # 1 => { params: { val: 'inputFieldValue', top: '24%', left: '54.5%', width: '10%', class_name: 'document-rectangle', input_type: 'string', textAlign: 'right' } }

        # 2 => { params: { val: 'None', top: '24.95%', left: '64.4%', width: '4%', class_name: 'document-rectangle', input_type: 'button' } },
      },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      second_click_off: true,
      translation_key: 'gasScheduled',
      category: 'building'
      # borderColor: 'blue'
    },

    gas_notes: {
      name: 'gas_notes',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '72.7%', left: '71.2%', width: '20.5%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 20,
      translation_key: 'gasNotes',
      category: 'building',
      translation_field: 'gas_notes_translation'
    },

    gas_notes_translation: {
      name: 'gas_notes_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '74%', left: '71.2%', width: '20.5%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 20,
      translation_key: 'gasNotes',
      category: 'building',
      translation_object: true
    },

    # sewage: {
    #   # !!! SELECT
    #   name: 'sewage',
    #   input_type: 'string',
    #   choices: {
    #     # 0: { params: { val: 'inputFieldValue', top: '27.3%', left: '17.1%', width: '10.5%', class_name: 'document-rectangle', input_type: 'string' } },
    #     0 => { params: { val: 'Public Sewer', top: '75.8%', left: '17.3%', width: '16%', height: '19px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' } },
    #     1 => { params: { val: 'Septic Tank', top: '75.8%', left: '17.3%', width: '16%', height: '19px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' } },
    #     2 => { params: { val: 'None', top: '75.8%', left: '17.3%', width: '16%', height: '19px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' } },
    #   },
    #   className: 'form-control-document',
    #   # height: '23px',
    #   # component: 'SelectField'
    #   # component: 'DocumentChoices'
    #   component: 'select',
    #   mapToModel: Building,
    #   # borderColor: 'blue'
    # },
    #
    # sewage_translation: {
    #   # !!! SELECT
    #   name: 'sewage_translation',
    #   input_type: 'string',
    #   choices: {
    #     # 0: { params: { val: 'inputFieldValue', top: '27.3%', left: '17.1%', width: '10.5%', class_name: 'document-rectangle', input_type: 'string' } },
    #     0 => { params: { val: 'Public Sewer', top: '75.8%', left: '17.3%', width: '16%', height: '19px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' } },
    #     1 => { params: { val: 'Septic Tank', top: '75.8%', left: '17.3%', width: '16%', height: '19px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' } },
    #     2 => { params: { val: 'None', top: '75.8%', left: '17.3%', width: '16%', height: '19px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' } },
    #   },
    #   className: 'form-control-document',
    #   # height: '23px',
    #   # component: 'SelectField'
    #   # component: 'DocumentChoices'
    #   component: 'select',
    #   mapToModel: Building,
    #   # borderColor: 'blue'
    # },


    sewage: {
      name: 'sewage',
      input_type: 'string',
      choices: {
        0 => { params: {
          val: 'inputFieldValue',
          top: '75.8%',
          left: '17.3%',
          width: '17.7%',
          height: '18px',
          font_size: '10px',
          class_name: 'document-rectangle',
          input_type: 'string' },
          selectChoices: building[:sewage][:choices],
          showLocalLanguage: true,
          baseLanguageField: true },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_record: 'building_languages',
      # name is the column in model building language
      translation_column: 'sewage',
      # translation field is the field in the document that takes the translation
      translation_field: 'sewage_translation',
      language_independent: true,
      translation_key: 'sewage',
      category: 'building'
      # translation_sibling: 'sewage_translation'
    },

    sewage_translation: {
      name: 'sewage_translation',
      input_type: 'string',
      choices: {
        0 => { params: {
          val: 'inputFieldValue',
          top: '77.2%',
          left: '17.3%',
          width: '17.7%',
          height: '18px',
          font_size: '10px',
          class_name: 'document-rectangle',
          input_type: 'string' },
          selectChoices: building[:sewage][:choices],
          showLocalLanguage: true
        },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'sewage',
      category: 'building',
      translation_object: true
    },

    sewage_year: {
      name: 'sewage_year',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '75.75%', left: '36%', width: '4.9%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'yearSewage',
      category: 'building',
      group: 'sewageDate'
    },

    sewage_month: {
      name: 'sewage_month',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '75.75%', left: '43%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'monthSewage',
      category: 'building',
      group: 'sewageDate'
    },

    sewage_day: {
      name: 'sewage_day',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '75.75%', left: '48.6%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'daySewage',
      category: 'building',
      group: 'sewageDate'
    },

    sewage_scheduled: {
      name: 'sewage_scheduled',
      input_type: 'string',
      choices: {
        0 => { params: {
          val: 'inputFieldValue',
          top: '75.8%',
          left: '53.5%',
          width: '17.3%',
          font_size: '10px',
          class_name: 'document-rectangle',
          input_type: 'string' },
          selectChoices: building[:sewage][:choices],
          showLocalLanguage: true,
          baseLanguageField: true
        },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 20,
      translation_key: 'sewageScheduled',
      category: 'building',
      translation_field: 'sewage_scheduled_translation'
      # language_independent: true
    },

    sewage_scheduled_translation: {
      name: 'sewage_scheduled_translation',
      input_type: 'string',
      choices: {
        0 => { params: {
          val: 'inputFieldValue',
          top: '77.1%',
          left: '53.5%',
          width: '17.3%',
          font_size: '10px',
          class_name: 'document-rectangle',
          input_type: 'string' },
          # selectChoices: building[:sewage][:choices],
          showLocalLanguage: true
        },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 20,
      translation_key: 'sewageScheduled',
      category: 'building',
      translation_object: true
    },

    sewage_notes: {
      name: 'sewage_notes',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '75.8%', left: '71.2%', width: '20.5%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 20,
      translation_key: 'sewageNotes',
      category: 'building',
      translation_field: 'sewage_notes_translation'
    },

    sewage_notes_translation: {
      name: 'sewage_notes_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '77.1%', left: '71.2%', width: '20.5%', font_size: '12px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 20,
      translation_key: 'sewageNotes',
      category: 'building',
      translation_object: true
    },

    building_inspection_conducted: {
      name: 'building_inspection_conducted',
      input_type: 'boolean',
      choices: {
        0 => { valName: 'Y', params: { val: true, top: '83.9%', left: '58.1%', width: '5%', class_name: 'document-rectangle', input_type: 'button' },
              translation: translation[:yes][:translations] },
        1 => { valName: 'N', params: { val: false, top: '83.9%', left: '78.9%', width: '5%', class_name: 'document-rectangle', input_type: 'button' },
              translation: translation[:no][:translations] }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'inspectionConducted',
      category: 'building'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    building_inspection_summary: {
      name: 'building_inspection_summary',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '87.1%', left: '50.1%', width: '41.5%', height: '5.2%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_record: 'inspections',
      # # name is the column in model building language
      translation_column: 'inspection_summary',
      # # translation field is the field in the document that takes the translation
      translation_field: 'building_inspection_summary_translation',
      translation_key: 'inspectionSummaryTemplate',
      category: 'building'
      # translation_sibling: 'building_inspection_summary_translation'
    },

    building_inspection_summary_translation: {
      name: 'building_inspection_summary_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '92.1%', left: '50.1%', width: '41.5%', height: '5.2%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'inspectionSummary',
      category: 'building',
      translation_object: true
    },
  #
  # },
  # 3: {
    kitchen: {
      name: 'kitchen',
      input_type: 'string',
      choices: {
            0 => { valName: 'Y', params: {
              val: true,
              top: '16.8%',
              left: '28.6%',
              width: '11.1%',
              height: '24px',
              margin: '0px',
              class_name: 'document-rectangle',
              input_type: 'string' },
              #
              # selectChoices: amenities.kitchen.choices,
              selectChoices: amenities[:kitchen][:choices],
              showLocalLanguage: true,
              combineLanguages: true
            },
            1 => { valName: 'N', params: {
              val: false,
              top: '16.8%',
              left: '28.6%',
              width: '11.1%',
              height: '24px',
              margin: '0px',
              class_name: 'document-rectangle',
              input_type: 'string' },
              selectChoices: amenities[:kitchen][:choices],
              # selectChoices: Amenities.kitchen.choices,
              showLocalLanguage: true,
              combineLanguages: true
            }
           },
      className: 'form-control-document',
      component: 'select',
      translation_key: 'kitchen',
      category: 'flat',
      group: 'kitchen'
      # height: '23px',
      # mapToModel: Amenities,
    },

    kitchen_format: {
      name: 'kitchen_format',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '15.9%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'format',
      category: 'flat',
      group: 'kitchen',
      translation_field: 'kitchen_format_translation'
    },

    kitchen_format_translation: {
      name: 'kitchen_format_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '17.9%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'format',
      category: 'flat',
      translation_object: true,
      group: 'kitchen'
    },

    kitchen_other: {
      name: 'kitchen_other',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '15.9%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      group: 'kitchen',
      translation_field: 'kitchen_other_translation'
    },

    kitchen_other_translation: {
      name: 'kitchen_other_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '17.9%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      translation_object: true,
      group: 'kitchen'
    },

    toilet: {
      name: 'toilet',
      input_type: 'string',
      choices: {
             0 => { valName: 'Y', params: {
               val: true,
               top: '20.9%',
               left: '28.6%',
               width: '11.1%',
               height: '24px',
               margin: '0px',
               class_name: 'document-rectangle',
               input_type: 'string' },
               #
               selectChoices: flat_for_documents[:toilet][:choices],
               showLocalLanguage: true,
               combineLanguages: true
             },
            1 => { valName: 'N', params: {
              val: false,
              top: '20.9%',
              left: '28.6%',
              width: '11.1%',
              height: '24px',
              margin: '0px',
              class_name: 'document-rectangle',
              input_type: 'string' },
              #
              selectChoices: flat_for_documents[:toilet][:choices],
              showLocalLanguage: true,
              combineLanguages: true
            }
           },
      className: 'form-control-document',
      component: 'select',
      translation_key: 'toilet',
      category: 'flat',
      group: 'toilet'
      # height: '23px',
      # mapToModel: FlatForDocuments,!!!!!!!!!
    },

    toilet_format: {
      name: 'toilet_format',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '20%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'format',
      category: 'flat',
      group: 'toilet',
      translation_field: 'toilet_format_translation'
    },

    toilet_format_translation: {
      name: 'toilet_format_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '22%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'format',
      category: 'flat',
      translation_object: true,
      group: 'toilet'
    },

    toilet_other: {
      name: 'toilet_other',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '20%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      group: 'toilet',
      translation_field: 'toilet_other_translation'
    },

    toilet_other_translation: {
      name: 'toilet_other_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '22%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      translation_object: true,
      group: 'toilet'
    },

    bath_tub: {
      name: 'bath_tub',
      input_type: 'string',
      choices: {
             0 => { valName: 'Y', params: {
               val: true,
               top: '25%',
               left: '28.6%',
               width: '11.1%',
               height: '24px',
               margin: '0px',
               class_name: 'document-rectangle',
               input_type: 'string' },
               # selectChoices: Amenities.bath_tub.choices,
               selectChoices: amenities[:bath_tub][:choices],
               showLocalLanguage: true,
               combineLanguages: true
             },
            1 => { valName: 'N', params: {
               val: false,
               top: '25%',
               left: '28.6%',
               width: '11.1%',
               height: '24px',
               margin: '0px',
               class_name: 'document-rectangle',
               input_type: 'string' },
               #selectChoices: Amenities.bath_tub.choices,
               selectChoices: amenities[:bath_tub][:choices],
               showLocalLanguage: true,
               combineLanguages: true
             }
           },
      className: 'form-control-document',
      component: 'select',
      translation_key: 'bathtub',
      category: 'flat',
      group: 'bathTub'
      # height: '23px',
      # mapToModel: Amenities,
    },

    bath_tub_format: {
      name: 'bath_tub_format',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '24.1%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'format',
      category: 'flat',
      group: 'bathTub',
      translation_field: 'bath_tub_format_translation'
    },

    bath_tub_format_translation: {
      name: 'bath_tub_format_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '26.1%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'format',
      category: 'flat',
      translation_object: true,
      group: 'bathTub'
    },

    bath_tub_other: {
      name: 'bath_tub_other',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '24.1%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      group: 'bathTub',
      translation_field: 'bath_tub_other_translation'
    },

    bath_tub_other_translation: {
      name: 'bath_tub_other_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '26.1%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      translation_object: true,
      group: 'bathTub'
    },

    hot_water: {
      name: 'hot_water',
      input_type: 'string',
      choices: {
             0 => { valName: 'Y', params: {
               val: true,
               top: '29.1%',
               left: '28.6%',
               width: '11.1%',
               height: '24px',
               margin: '0px',
               class_name: 'document-rectangle',
               input_type: 'string' },
               # selectChoices: Amenities.hot_water.choices,
               selectChoices: amenities[:hot_water][:choices],
               showLocalLanguage: true,
               combineLanguages: true
             },
            1 => { valName: 'N', params: {
              val: false,
              top: '29.1%',
              left: '28.6%',
              width: '11.1%',
              height: '24px',
              margin: '0px',
              class_name: 'document-rectangle',
              input_type: 'string' },
              # selectChoices: Amenities.hot_water.choices,
              selectChoices: amenities[:hot_water][:choices],
              showLocalLanguage: true,
              combineLanguages: true
            }
           },
      className: 'form-control-document',
      component: 'select',
      translation_key: 'waterHeater',
      category: 'flat',
      group: 'hotWater'
      # height: '23px',
      # mapToModel: Amenities,
    },

    hot_water_format: {
      name: 'hot_water_format',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '28.2%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'format',
      category: 'flat',
      group: 'hotWater',
      translation_field: 'hot_water_format_translation'
    },

    hot_water_format_translation: {
      name: 'hot_water_format_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '30.2%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'format',
      category: 'flat',
      translation_object: true,
      group: 'hotWater'
    },

    hot_water_other: {
      name: 'hot_water_other',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '28.2%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      group: 'hotWater',
      translation_field: 'hot_water_other_translation'
    },

    hot_water_other_translation: {
      name: 'hot_water_other_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '30.2%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      translation_object: true,
      group: 'hotWater'
    },

    kitchen_grill: {
      name: 'kitchen_grill',
      input_type: 'string',
      choices: {
             0 => { valName: 'Y', params: { val: true, top: '33.2%', left: '28.6%', width: '11.1%', height: '24px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' },
             # selectChoices: Amenities.kitchen_grill.choices,
             selectChoices: amenities[:kitchen_grill][:choices],
             showLocalLanguage: true,
             combineLanguages: true
           },
            1 => { valName: 'N', params: { val: false, top: '33.2%', left: '28.6%', width: '11.1%', height: '24px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' },
            # selectChoices: Amenities.kitchen_grill.choices,
            selectChoices: amenities[:kitchen_grill][:choices],
            showLocalLanguage: true,
            combineLanguages: true
          }
           },
      className: 'form-control-document',
      component: 'select',
      translation_key: 'kitchenStove',
      category: 'flat',
      group: 'kitchenGrill'
      # height: '23px',
      # mapToModel: Amenities,!!!!!!!!!!!!!!!!!
    },

    kitchen_grill_format: {
      name: 'kitchen_grill_format',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '32.3%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'format',
      category: 'flat',
      group: 'kitchenGrill',
      translation_field: 'kitchen_grill_format_translation'
    },

    kitchen_grill_format_translation: {
      name: 'kitchen_grill_format_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '34.3%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'format',
      category: 'flat',
      translation_object: true,
      group: 'kitchenGrill'
    },

    kitchen_grill_other: {
      name: 'kitchen_grill_other',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '32.3%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      group: 'kitchenGrill',
      translation_field: 'kitchen_grill_other_translation'
    },

    kitchen_grill_other_translation: {
      name: 'kitchen_grill_other_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '34.3%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      translation_object: true,
      group: 'kitchenGrill'
    },

    ac: {
      name: 'ac',
      input_type: 'string',
      choices: {
             0 => { valName: 'Y', params: { val: true, top: '37.3%', left: '28.6%', width: '11.1%', height: '24px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' },
             # selectChoices: Amenities.ac.choices,
             selectChoices: amenities[:ac][:choices],
             showLocalLanguage: true,
             combineLanguages: true
           },
            1 => { valName: 'N', params: { val: false, top: '37.3%', left: '28.6%', width: '11.1%', height: '24px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' },
            # selectChoices: Amenities.ac.choices,
            selectChoices: amenities[:ac][:choices],
            showLocalLanguage: true,
            combineLanguages: true
          }
           },
      className: 'form-control-document',
      component: 'select',
      translation_key: 'ac',
      category: 'flat',
      group: 'ac'
      # height: '23px',
      # mapToModel: Amenities,
    },

    ac_format: {
      name: 'ac_format',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '36.4%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'format',
      category: 'flat',
      group: 'ac',
      translation_field: 'ac_format_translation'
    },

    ac_format_translation: {
      name: 'ac_format_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '38.4%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'ac',
      category: 'flat',
      translation_object: true,
      group: 'ac'
    },

    ac_other: {
      name: 'ac_other',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '36.4%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      group: 'ac',
      translation_field: 'ac_other_translation'
    },

    ac_other_translation: {
      name: 'ac_other_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '38.4%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      translation_key: 'other',
      category: 'flat',
      translation_object: true,
      group: 'ac'
    },

    equipment1_name: {
      name: 'equipment1_name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '40.5%', left: '8.6%', width: '19%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'equipment',
      # category: 'flat'
    },

    equipment1_name_translation: {
      name: 'equipment1_name_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '42.5%', left: '8.6%', width: '19%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'equipmentName',
      # category: 'flat',
      # translation_object: true
    },

    equipment1: {
      name: 'equipment1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '41.4%', left: '28%', width: '11.1%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      # choices: {
      #        0 => { valName: 'Y', params: { val: true, top: '71.65%', left: '29.3%', width: '7%', height: '24px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' } },
      #       1 => { valName: 'N', params: { val: false, top: '71.65%', left: '29.3%', width: '7%', height: '24px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' } }
      #      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # height: '23px',
      # mapToModel: Amenities,
    },

    equipment1_format: {
      name: 'equipment1_format',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '40.5%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'format',
      # category: 'flat'
    },

    equipment1_format_translation: {
      name: 'equipment1_format_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '42.5%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'format',
      # category: 'flat',
      # translation_object: true
    },

    equipment1_other: {
      name: 'equipment1_other',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '40.5%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'other',
      # category: 'flat'
    },

    equipment1_other_translation: {
      name: 'equipment1_other_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '42.5%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'other',
      # category: 'flat',
      # translation_object: true
    },

    equipment2_name: {
      name: 'equipment2_name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '44.6%', left: '8.6%', width: '19%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'equipmentName',
      # category: 'flat'
    },

    equipment2_name_translation: {
      name: 'equipment2_name_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '46.6%', left: '8.6%', width: '19%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'equipmentName',
      # category: 'flat',
      # translation_object: true
    },

    equipment2: {
      name: 'equipment2',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '45.5%', left: '28%', width: '11.1%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      # choices: {
      #        0 => { valName: 'Y', params: { val: true, top: '44.6%', left: '29.3%', width: '7%', height: '24px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' } },
      #       1 => { valName: 'N', params: { val: false, top: '44.6%', left: '29.3%', width: '7%', height: '24px', margin: '0px', class_name: 'document-rectangle', input_type: 'string' } }
      #      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # translation_key: 'equipment',
      # category: 'flat'
      # height: '23px',
      # mapToModel: Amenities,
    },

    equipment2_format: {
      name: 'equipment2_format',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '44.6%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'format',
      # category: 'flat'
    },

    equipment2_format_translation: {
      name: 'equipment2_format_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '46.6%', left: '39.4%', width: '18.5%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'format',
      # category: 'flat',
      # translation_object: true
    },

    equipment2_other: {
      name: 'equipment2_other',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '44.6%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'other',
      # category: 'flat'
    },

    equipment2_other_translation: {
      name: 'equipment2_other_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '46.6%', left: '58.5%', width: '33%', height: '1.8%', margin: '0', font_size: '10px', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 8,
      # translation_key: 'other',
      # category: 'flat',
      # translation_object: true
    },

    inside_disaster_prevention: {
      name: 'inside_disaster_prevention',
      input_type: 'boolean',
      choices: {
        0 => { valName: 'Y', params: { val: true, top: '54.2%', left: '21%', width: '18.5%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { valName: 'N', params: { val: false, top: '54.2%', left: '62.7%', width: '18.5%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'inDisasterPreventionTemplate',
      category: 'building'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    inside_disaster_warning: {
      name: 'inside_disaster_warning',
      input_type: 'boolean',
      choices: {
        0 => { valName: 'Y', params: { val: true, top: '63%', left: '21%', width: '18.5%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { valName: 'N', params: { val: false, top: '63%', left: '62.5%', width: '18.5%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'inLandslideWarningTemplate',
      category: 'building'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    inside_tsunami_warning: {
      name: 'inside_tsunami_warning',
      input_type: 'boolean',
      choices: {
        0 => { valName: 'Y', params: { val: true, top: '73.9%', left: '21%', width: '18.5%', class_name: 'document-rectangle', input_type: 'button' } },
       1 => { valName: 'N', params: { val: false, top: '73.9%', left: '63%', width: '18.5%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'inTsunamiWarningTemplate',
      category: 'building'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    asbestos_record: {
      name: 'asbestos_record',
      input_type: 'boolean',
      choices: {
        0 => { valName: 'Y', params: { val: true, top: '84%', left: '58%', width: '5%', class_name: 'document-rectangle', input_type: 'button' } },
       1 => { valName: 'N', params: { val: false, top: '84%', left: '79%', width: '5%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'asbestosRecordsOnRecord',
      category: 'building',
      group: 'asbestos'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    asbestos_survey_contents: {
      name: 'asbestos_survey_contents',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '87%', left: '50.5%', width: '41%', height: '5.2%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_record: 'building_languages',
      # # name is the column in model building language
      translation_column: 'asbestos_survey_contents',
      # # translation field is the field in the document that takes the translation
      translation_field: 'asbestos_survey_contents_translation',
      translation_key: 'asbestosSurveyContents',
      category: 'building',
      group: 'asbestos'
      # translation_sibling: 'asbestos_survey_contents_translation'
    },

    asbestos_survey_contents_translation: {
      name: 'asbestos_survey_contents_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '92.5%', left: '50.5%', width: '41%', height: '5.2%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'asbestosSurveyContents',
      category: 'building',
      translation_object: true,
      group: 'asbestos'
    },
  # },
  # 4: {
    earthquake_study_performed: {
      name: 'earthquake_study_performed',
      input_type: 'boolean',
      choices: {
        0 => { valName: 'Y', params: { val: true, top: '9.5%', left: '58.2%', width: '5%', class_name: 'document-rectangle', input_type: 'button' } },
       1 => { valName: 'N', params: { val: false, top: '9.5%', left: '79%', width: '5%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'earthQuakeStudyPerformed',
      category: 'building',
      group: 'earthquake'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    earthquake_study_contents: {
      name: 'earthquake_study_contents',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '13.2%', left: '50.5%', width: '41%', height: '5.2%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_record: 'building_languages',
      # # name is the column in model building language
      translation_column: 'earthquake_study_contents',
      # # translation field is the field in the document that takes the translation
      translation_field: 'earthquake_study_contents_translation',
      translation_key: 'earthquakeStudyContents',
      category: 'building',
      group: 'earthquake'
      # translation_sibling: 'earthquake_study_contents_translation'
    },

    earthquake_study_contents_translation: {
      name: 'earthquake_study_contents_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '18.7%', left: '50.5%', width: '41%', height: '5.2%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'earthquakeStudyContents',
      category: 'building',
      translation_object: true,
      group: 'earthquake'
    },

    other_payments1: {
      name: 'other_payments1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '41.1%', left: '12.2%', width: '15%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 16,
      translation_key: 'nonRentCharges',
      category: 'agreement',
      group: 'otherPayments'
    },

    other_payments1_explanation: {
      name: 'other_payments1_explanation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '40.2%', left: '29.5%', width: '61.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 60,
      translation_key: 'nonRentChargesExplanation',
      category: 'agreement',
      group: 'otherPayments',
      translation_field: 'other_payments1_explanation_translation',
      extraHeightTemplate: true
    },

    other_payments1_explanation_translation: {
      name: 'other_payments1_explanation_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '42%', left: '29.5%', width: '61.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 60,
      translation_key: 'nonRentChargesExplanation',
      category: 'agreement',
      translation_object: true
    },

    other_payments2: {
      name: 'other_payments2',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '44.8%', left: '12.2%', width: '15%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 16,
      # translation_key: 'nonRentCharges',
      # category: 'agreement'
    },

    other_payments2_explanation: {
      name: 'other_payments2_explanation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '43.9%', left: '29.5%', width: '61.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 60,
      # translation_key: 'nonRentChargesExplanation',
      # category: 'agreement'
    },

    other_payments2_explanation_translation: {
      name: 'other_payments2_explanation_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '45.7%', left: '29.5%', width: '61.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 60,
      # translation_key: 'nonRentChargesExplanation',
      # category: 'agreement',
      # translation_object: true
    },

    other_payments3: {
      name: 'other_payments3',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '48.5%', left: '12.2%', width: '15%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 16,
      # translation_key: 'nonRentCharges',
      # category: 'agreement'
    },

    other_payments3_explanation: {
      name: 'other_payments3_explanation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '47.6%', left: '29.5%', width: '61.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 60,
      # translation_key: 'nonRentChargesExplanation',
      # category: 'agreement'
    },

    other_payments3_explanation_translation: {
      name: 'other_payments3_explanation_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '49.4%', left: '29.5%', width: '61.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 60,
      # translation_key: 'nonRentChargesExplanation',
      # category: 'agreement',
      # translation_object: true
    },

    other_payments4: {
      name: 'other_payments4',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '52.6%', left: '12.2%', width: '15%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 16,
      # translation_key: 'nonRentCharges',
      # category: 'agreement'
    },

    other_payments4_explanation: {
      name: 'other_payments4_explanation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '51.4%', left: '29.5%', width: '61.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 60,
      # translation_key: 'nonRentChargesExplanation',
      # category: 'agreement'
    },

    other_payments4_explanation_translation: {
      name: 'other_payments4_explanation_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '53.2%', left: '29.5%', width: '61.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 60,
      # translation_key: 'nonRentChargesExplanation',
      # category: 'agreement',
      # translation_object: true
    },

    contract_break_terms: {
      name: 'contract_break_terms',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '60%', left: '9%', width: '83.4%', height: '18%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 600,
      translation_field: 'contract_break_terms_translation',
      translation_key: 'cancellation',
      category: 'agreement'
      # translation_sibling: 'contract_break_terms_translation'
    },

    contract_break_terms_translation: {
      name: 'contract_break_terms_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '78.5%', left: '9%', width: '83.4%', height: '18%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 600,
      translation_key: 'cancellation',
      category: 'agreement',
      translation_object: true
    },
  # },
  # 5: {
    warranties: {
      name: 'warranties',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '9.6%', left: '9%', width: '83.4%', height: '16%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 600,
      translation_field: 'warranties_translation',
      translation_key: 'damageCompensation',
      category: 'agreement',
      # translation_sibling: 'warranties_translation',
      extraHeightTemplate: true
    },

    warranties_translation: {
      name: 'warranties_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '25.7%', left: '9%', width: '83.4%', height: '16%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 600,
      translation_key: 'damageCompensation',
      category: 'agreement',
      translation_object: true
    },

    escrow_for_deposit: {
      name: 'escrow_for_deposit',
      input_type: 'boolean',
      choices: {
        0 => { valName: 'Y', params: { val: true, top: '46.8%', left: '48.1%', width: '10.5%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { valName: 'N', params: { val: false, top: '46.8%', left: '65.6%', width: '14%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'depositHeldInAccount',
      category: 'agreement',
      extraHeightTemplate: true
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    escrow_agent_deposit: {
      name: 'escrow_agent_deposit',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '50.8%', left: '34.5%', width: '57%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 60,
      translation_key: 'financialInstitution',
      category: 'agreement',
      translation_field: 'escrow_agent_deposit_translation',
      extraHeightTemplate: true
    },

    escrow_agent_deposit_translation: {
      name: 'escrow_agent_deposit_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '52.8%', left: '34.5%', width: '57%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 60,
      translation_key: 'guaranteeOfDeposits',
      category: 'agreement',
      translation_object: true,
      extraHeightTemplate: true
    },

    from_year: {
      name: 'from_year',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        0 => { params: { val: 'inputFieldValue', top: '60.4%', left: '32.6%', width: '5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'yearStart',
      category: 'agreement',
      group: 'contractPeriodFrom'
    },

    from_month: {
      name: 'from_month',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        0 => { params: { val: 'inputFieldValue', top: '60.4%', left: '40%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'monthStart',
      category: 'agreement',
      group: 'contractPeriodFrom'
    },

    from_day: {
      name: 'from_day',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        0 => { params: { val: 'inputFieldValue', top: '60.4%', left: '45.4%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'dayStart',
      category: 'agreement',
      group: 'contractPeriodFrom'
    },

    to_year: {
      name: 'to_year',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        0 => { params: { val: 'inputFieldValue', top: '64.2%', left: '32.6%', width: '5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'yearEnd',
      category: 'agreement',
      group: 'contractPeriodTo'
    },

    to_month: {
      name: 'to_month',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        0 => { params: { val: 'inputFieldValue', top: '64.2%', left: '40%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'monthEnd',
      category: 'agreement',
      group: 'contractPeriodTo'
    },

    to_day: {
      name: 'to_day',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        0 => { params: { val: 'inputFieldValue', top: '64.2%', left: '45.4%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'dayEnd',
      category: 'agreement',
      group: 'contractPeriodTo'
    },

    contract_length_years: {
      name: 'contract_length_years',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        0 => { params: { val: 'inputFieldValue', top: '60.3%', left: '57%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'years',
      category: 'agreement',
      group: 'contractPeriodLength'
    },

    contract_length_months: {
      name: 'contract_length_months',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        0 => { params: { val: 'inputFieldValue', top: '60.3%', left: '64.5%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'months',
      category: 'agreement',
      group: 'contractPeriodLength'
    },

    contract_type: {
      name: 'contract_type',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'ordinary_rental_contract', top: '60%', left: '73.2%', width: '17.5%', class_name: 'document-rectangle', input_type: 'button' },
           translation: translation[:ordinaryRentalContract][:translations] },
        1 => { params: { val: 'fixed_term_rental_contract', top: '63%', left: '73.2%', width: '17.5%', class_name: 'document-rectangle', input_type: 'button' },
           translation: translation[:fixedTermRentalContract][:translations] },
        2 => { params: { val: 'end_of_life_rental_contract', top: '65.9%', left: '73.2%', width: '17.5%', class_name: 'document-rectangle', input_type: 'button' },
           translation: translation[:endOfLifeRentalContract][:translations] },
      },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      translation_key: 'contractType',
      category: 'agreement'
      # borderColor: 'blue'
    },

    contract_renewal_terms: {
      name: 'contract_renewal_terms',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '69.1%', left: '24.6%', width: '27.5%', height: '6.2%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_field: 'contract_renewal_terms_translation',
      translation_key: 'termsOfRenewal',
      category: 'agreement'
      # translation_sibling: 'contract_renewal_terms_translation'
    },

    contract_renewal_terms_translation: {
      name: 'contract_renewal_terms_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '75.9%', left: '24.6%', width: '27.5%', height: '6.2%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'termsOfRenewal',
      category: 'agreement',
      translation_object: true
    },
  # },
  # 6: {
    limitations_use: {
      name: 'limitations_use',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '16.9%', left: '24.6%', width: '33.1%', height: '5%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'limitationsOnUse',
      category: 'agreement',
      translation_field: 'limitations_use_translation'
    },

    limitations_use_translation: {
      name: 'limitations_use_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '22.1%', left: '24.6%', width: '33.1%', height: '5%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'limitationsOnUse',
      category: 'agreement',
      translation_object: true
    },

    limitations_use_other: {
      name: 'limitations_use_other',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '16.9%', left: '58.4%', width: '33.1%', height: '5%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'limitationsOnUseAndOthers',
      category: 'agreement',
      translation_field: 'limitations_use_other_translation'
    },

    limitations_use_other_translation: {
      name: 'limitations_use_other_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '22.1%', left: '58.4%', width: '33.1%', height: '5%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'limitationsOnUseAndOthers',
      category: 'agreement',
      translation_object: true
    },

    restrictions_use: {
      name: 'restrictions_use',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '27.9%', left: '24.6%', width: '33.1%', height: '5%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'limitationsOnUse',
      category: 'agreement',
      translation_field: 'restrictions_use_translation'
    },

    restrictions_use_translation: {
      name: 'restrictions_use_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '33%', left: '24.6%', width: '33.1%', height: '5%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'limitationsOnUse',
      category: 'agreement',
      translation_object: true
    },

    restrictions_use_other: {
      name: 'restrictions_use_other',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '27.9%', left: '58.4%', width: '33.1%', height: '5%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'limitationsOnUseAndOthers',
      category: 'agreement',
      translation_field: 'restrictions_use_other_translation'
    },

    restrictions_use_other_translation: {
      name: 'restrictions_use_other_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '33%', left: '58.4%', width: '33.1%', height: '5%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'limitationsOnUseAndOthers',
      category: 'agreement',
      translation_object: true
    },

    deposit_return_terms: {
      name: 'deposit_return_terms',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '43.5%', left: '9.5%', width: '82.5%', height: '14.1%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 300,
      translation_field: 'deposit_return_terms_translation',
      translation_key: 'returnSecurityDeposit',
      category: 'agreement'
      # translation_sibling: 'deposit_return_terms_translation'
    },

    deposit_return_terms_translation: {
      name: 'deposit_return_terms_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '58%', left: '9.5%', width: '82.5%', height: '14.1%', font_size: '12px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 300,
      translation_key: 'returnSecurityDeposit',
      category: 'agreement',
      translation_object: true
    },

    building_management_company: {
      name: 'building_management_company',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '78%', left: '35%', width: '56.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_record: 'building_languages',
      # # name is the column in model building language
      translation_column: 'building_management_company',
      # # translation field is the field in the document that takes the translation
      translation_field: 'building_management_company_translation',
      translation_key: 'propertyManagement',
      category: 'building',
      group: 'buildingManagement'
      # translation_sibling: 'building_management_company_translation'
    },

    building_management_company_translation: {
      name: 'building_management_company_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '79.9%', left: '35%', width: '56.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 509,
      translation_key: 'propertyManagement',
      category: 'building',
      translation_object: true,
      group: 'buildingManagement'
    },

    building_management_registration: {
      name: 'building_management_registration',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '81.9%', left: '35%', width: '40%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 30,
      translation_key: 'registrationAgent',
      category: 'building',
      group: 'buildingManagement'
    },

    building_management_address: {
      name: 'building_management_address',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '92.7%', left: '35%', width: '56.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_record: 'building_languages',
      translation_column: 'building_management_address',
      translation_field: 'building_management_address_translation',
      translation_key: 'addressAgent',
      category: 'building',
      group: 'buildingManagement'
      # translation_sibling: 'building_management_address_translation'
    },

    building_management_address_translation: {
      name: 'building_management_address_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '95%', left: '35%', width: '56.5%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'addressAgent',
      category: 'building',
      translation_object: true,
      group: 'buildingManagement'
    },
  #
  # },
  # 7: {
    bond_deposit_office: {
      name: 'bond_deposit_office',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '22.6%', left: '29.5%', width: '63%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'bondOfficeAddress',
      category: 'broker',
      group: 'bond',
      translation_field: 'bond_deposit_office_translation',
      # translation_sibling: 'bond_deposit_office_translation',
      extraHeightTemplate: true
    },

    bond_deposit_office_translation: {
      name: 'bond_deposit_office_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '24.9%', left: '29.5%', width: '63%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'bondOfficeAddress',
      category: 'broker',
      translation_object: true,
      group: 'bond'
    },

    bond_deposit_office_address: {
      name: 'bond_deposit_office_address',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '27.2%', left: '29.5%', width: '63%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'address',
      category: 'broker',
      group: 'bond',
      translation_field: 'bond_deposit_office_address_translation'
    },

    bond_deposit_office_address_translation: {
      name: 'bond_deposit_office_address_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '29.5%', left: '29.5%', width: '63%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'address',
      category: 'broker',
      translation_object: true,
      group: 'bond'
    },

    guaranty_association_name: {
      name: 'guaranty_association_name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '39%', left: '33.1%', width: '58.4%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'association',
      category: 'broker',
      group: 'guaranty',
      translation_field: 'guaranty_association_name_translation',
      extraHeightTemplate: true
    },

    guaranty_association_name_translation: {
      name: 'guaranty_association_name_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '41.3%', left: '33.1%', width: '58.4%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'association',
      category: 'broker',
      translation_object: true,
      group: 'guaranty'
    },

    guaranty_association_address: {
      name: 'guaranty_association_address',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '44.5%', left: '33.1%', width: '58.4%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'address',
      category: 'broker',
      group: 'guaranty',
      translation_field: 'guaranty_association_address_translation'
    },

    guaranty_association_address_translation: {
      name: 'guaranty_association_address_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '46.8%', left: '33.1%', width: '58.4%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'address',
      category: 'broker',
      translation_object: true,
      group: 'guaranty'
    },

    guaranty_association_office_address: {
      name: 'guaranty_association_office_address',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '50.1%', left: '33.1%', width: '58.4%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'address',
      category: 'broker',
      group: 'guaranty',
      translation_field: 'guaranty_association_office_address_translation'
    },

    guaranty_association_office_address_translation: {
      name: 'guaranty_association_office_address_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '52.4%', left: '33.1%', width: '58.4%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      translation_key: 'address',
      category: 'broker',
      translation_object: true,
      group: 'guaranty'
    },

    bond_deposit_office_1: {
      name: 'bond_deposit_office_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '55.5%', left: '33.1%', width: '58.4%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      baseKey: 'bond_deposit_office',
      # translation_key: 'bondOfficeAddress',
      # category: 'bond'
    },

    bond_deposit_office_1_translation: {
      name: 'bond_deposit_office_1_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '57.3%', left: '33.1%', width: '58.4%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      # translation_key: 'bondOfficeAddress',
      # category: 'broker',
      # translation_object: true
    },

    bond_deposit_office_address_1: {
      name: 'bond_deposit_office_address_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '59%', left: '33.1%', width: '58.4%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      baseKey: 'bond_deposit_office_address',
      # translation_key: 'address',
      # category: 'broker'
    },

    bond_deposit_office_address_1_translation: {
      name: 'bond_deposit_office_address_1_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '60.8%', left: '33.1%', width: '58.4%', height: '1.8%', margin: '0', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      charLimit: 50,
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
    },
  # },
  # 8: {
    date_prepared: {
      name: 'date_prepared',
      input_type: 'date',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '11.3%', left: '74.7%', width: '16%', height: '1.8%', margin: '0', font_size: '13px', class_name: 'document-rectangle', input_type: 'date' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      translation_key: 'datePrepared',
      category: 'document'
      # charLimit: 50,
    },

    building_name_1: {
      name: 'building_name_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '14.4%', left: '32.4%', width: '53.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      baseKey: 'name',
      translation_record: 'building_languages',
      # # name is the column in model building language
      translation_column: 'name',
      # # translation field is the field in the document that takes the translation
      translation_field: 'building_name_1_translation',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    building_name_1_translation: {
      name: 'building_name_1_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '16.5%', left: '32.4%', width: '53.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
      # baseKey: 'name'
    },

    address_1: {
      name: 'address_1',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '18.4%', left: '32.4%', width: '47%', height: '3%', font_size: '13px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      baseKey: 'address',
      translation_record: 'flat_languages',
      translation_field: 'address_1_translation',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    address_1_translation: {
      name: 'address_1_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '21.2%', left: '32.4%', width: '47%', height: '3%', font_size: '13px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      # baseKey: 'address',
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
    },

    address_check: {
      name: 'address_check',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'address_exists', enclosed_text: 'X', top: '18.4%', left: '79.9%', width: '3%', class_name: 'document-rectangle', input_type: 'button' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 1,
      # xbox mean check box toggle with x inside button div
      # xbox: true,
      second_click_off: true,
      # translation_key: 'address',
      # category: 'broker',
      # translation_object: true
    },

    address_site_check: {
      name: 'address_site_check',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'address_sit_exists', enclosed_text: 'X', top: '21%', left: '79.9%', width: '3%', class_name: 'document-rectangle', input_type: 'button' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 1,
      # xbox: true,
      second_click_off: true,
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    building_name_2: {
      name: 'building_name_2',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '24%', left: '43.5%', width: '24.5%', height: '2%', font_size: '13px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      baseKey: 'name',
      charLimit: 100,
      translation_record: 'building_languages',
      # # name is the column in model building language
      translation_column: 'name',
      # # translation field is the field in the document that takes the translation
      translation_field: 'building_name_2_translation',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    building_name_2_translation: {
      name: 'building_name_2_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '26.3%', left: '43.5%', width: '24.5%', height: '2%', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      baseKey: 'name',
      charLimit: 100,
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
    },

    unit_1: {
      name: 'unit_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '24.6%', left: '79.5%', width: '6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      baseKey: 'unit',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # charLimit: 10,
    },

    construction_1: {
      name: 'construction_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'Wooden', enclosed_text: 'X', top: '28.9%', left: '33.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'S', enclosed_text: 'X', top: '28.9%', left: '44.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Aluminum', enclosed_text: 'X', top: '28.9%', left: '57.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
      },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      baseKey: 'construction',
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # borderColor: 'blue'
    },

    floors: {
      name: 'floors',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '32.7%', left: '38.2%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'floors',
      category: 'building'
      # charLimit: 10,
    },

    floors_underground: {
      name: 'floors_underground',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '32.7%', left: '51.2%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'floorsUnderground',
      category: 'building'
      # charLimit: 10,
    },

    size_1: {
      name: 'size_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '32.7%', left: '81.2%', width: '6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # charLimit: 10,
      baseKey: 'size',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    inspection_date: {
      name: 'inspection_date',
      input_type: 'date',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '36.7%', left: '33.2%', width: '16%', height: '1.8%', margin: '0', font_size: '13px', class_name: 'document-rectangle', input_type: 'date' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # charLimit: 10,
      baseKey: 'size',
      translation_key: 'inspectionDate',
      category: 'inspection'
    },

    flat_type: {
      name: 'flat_type',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'single_family', enclosed_text: 'X', top: '39.2%', left: '33.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: ['flat_sub_type'], value: '' },
          translation: translation[:singleFamily][:translations] },
        1 => { params: { val: 'flat_in_building', enclosed_text: 'X', top: '42.5%', left: '33.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' }, inactive: true,
          translation: translation[:multiFamily][:translations] },
        2 => { params: { val: 'town_house', enclosed_text: 'X', top: '42.5%', left: '33.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' }, inactive: true,
          translation: translation[:detachedType][:translations] },
        # 3 => { params: { val: 'others', top: '27.3%', left: '27%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      # box: { style: { display: 'flex', flexDirection: 'column', justifyContent: 'center' } },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      translation_key: 'flatType',
      category: 'flat'
    },

    # dependentKeys changes other fields to value (self is its own val); eg if below single_family clicked, field flat_sub_types turns to ''
    flat_sub_type: {
      name: 'flat_sub_type',
      input_type: 'string',
      choices: {
        # 0: { params: { val: 'single_family', enclosed_text: 'X', top: '33.5%', left: '33.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        0 => { params: { val: 'town_house', enclosed_text: 'X', top: '42.5%', left: '55.4%', width: '2%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: ['flat_type'], value: 'self' } },
        1 => { params: { val: 'flat_in_building', enclosed_text: 'X', top: '42.5%', left: '70.8%', width: '2%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: ['flat_type'], value: 'self' } },
        # 3 => { params: { val: 'others', top: '27.3%', left: '27%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      # box: { style: { display: 'flex', flexDirection: 'column', justifyContent: 'center' } },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      baseKey: 'flat_type',
      translation_key: 'flatSubType',
      category: 'flat'
      # dependentValue: 'single_family'
      # changeBaseKey: true,
    },

    degradation_exists_wooden: {
      name: 'degradation_exists_wooden',
      input_type: 'boolean',
      choices: {
        0 => { valName: 'Y', params: { val: true, enclosed_text: 'X', top: '47.4%', left: '77.9%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { valName: 'N', params: { val: false, enclosed_text: 'X', top: '47.4%', left: '85.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      wooden: true,
      summaryKey: true,
      inactive: true,
      translation_key: 'presenceOfDegradationWooden',
      category: 'inspection'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    foundation: {
      name: 'foundation',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '61%', left: '48.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '61%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '61%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'foundation',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    floor_assembly: {
      name: 'floor_assembly',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '63.2%', left: '48.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '63.2%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '63.2%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'baseAndFloorAssemble',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    floor: {
      name: 'floor',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '65.7%', left: '48.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '65.7%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '65.7%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'floor',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    pillars: {
      name: 'pillars',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '68.3%', left: '48.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '68.3%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '68.3%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'pillarsAndBeams',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    exterior_walls: {
      name: 'exterior_walls',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '70.8%', left: '48.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '70.8%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '70.8%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'exteriorWallsAndEaves',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    balcony: {
      name: 'balcony',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '73.4%', left: '48.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '73.4%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '73.4%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'balcony',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    interior_walls: {
      name: 'interior_walls',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '76%', left: '48.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '76%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '76%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'interiorWalls',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    ceilings: {
      name: 'ceilings',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '78.5%', left: '48.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '78.5%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '78.5%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'ceilings',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    roof_truss: {
      name: 'roof_truss',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '81%', left: '48.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '81%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '81%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'roofTruss',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    termite_damage: {
      name: 'termite_damage',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '85.3%', left: '48.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '85.3%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '85.3%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'termiteDamage',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    corrosion: {
      name: 'corrosion',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '87.9%', left: '48.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '87.9%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '87.9%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'rotCorrosion',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    reinforcement: {
      name: 'reinforcement',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '90.5%', left: '48.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '90.5%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '90.5%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'reinforcementArrangements',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    concrete_compression: {
      name: 'concrete_compression',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '93.3%', left: '48.1%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '93.3%', left: '51.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '93.3%', left: '55.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'concreteCompression',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    exterior_walls_rain: {
      name: 'exterior_walls_rain',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '61%', left: '76.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '61%', left: '80.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '61%', left: '83.8%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'exteriorWalls',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    eaves_rain: {
      name: 'eaves_rain',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '63.2%', left: '76.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '63.2%', left: '80.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '63.2%', left: '83.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'eaves',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    balcony_rain: {
      name: 'balcony_rain',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '65.7%', left: '76.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '65.7%', left: '80.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '65.7%', left: '83.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'balconyRain',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    interior_walls_rain: {
      name: 'interior_walls_rain',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '68.3%', left: '76.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '68.3%', left: '80.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '68.3%', left: '83.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'interiorWallsRain',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    ceilings_rain: {
      name: 'ceilings_rain',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '70.9%', left: '76.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '70.9%', left: '80.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '70.9%', left: '83.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'ceilingsRain',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    roof_truss_rain: {
      name: 'roof_truss_rain',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '73.3%', left: '76.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '73.3%', left: '80.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '73.3%', left: '83.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'roofTrussRain',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    roof: {
      name: 'roof',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '76.3%', left: '76.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '76.3%', left: '80.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '76.3%', left: '83.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: true,
      translation_key: 'roofRain',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },
  # },
  # 9: {
    inspector_name: {
      name: 'inspector_name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '5.4%', left: '32.5%', width: '47%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_record: 'inspections',
      # # name is the column in model building language
      translation_column: 'inspector_name',
      # # translation field is the field in the document that takes the translation
      translation_field: 'inspector_name_translation',
      translation_key: 'nameInspector',
      category: 'inspection',
      group: 'inspector'
      # translation_field: 'inspector_name_translation'
    },

    inspector_name_translation: {
      name: 'inspector_name_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '6.9%', left: '32.5%', width: '47%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'nameInspector',
      category: 'inspection',
      translation_object: true,
      group: 'inspector'
    },

    inspector_trainer: {
      name: 'inspector_trainer',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '10%', left: '32%', width: '34.4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_record: 'inspections',
      # # name is the column in model building language
      translation_column: 'inspector_trainer',
      # # translation field is the field in the document that takes the translation
      translation_field: 'inspector_trainer_translation',
      translation_key: 'nameOfAgency',
      category: 'inspection',
      group: 'inspector',
      # translation_field: 'inspector_trainer_translation',
      extraHeightTemplate: true
    },

    inspector_trainer_translation: {
      name: 'inspector_trainer_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '13.6%', left: '32%', width: '34.4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'nameOfAgency',
      category: 'inspection',
      translation_object: true,
      group: 'inspector'
      # translation_record: 'inspections',
      # # # name is the column in model building language
      # translation_column: 'inspector_trainer',
      # # # translation field is the field in the document that takes the translation
      # translation_field: 'inspector_name_translation',
    },

    inspector_certificate_number: {
      name: 'inspector_certificate_number',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '12%', left: '67%', width: '23.4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'certificateNumber',
      category: 'inspection',
      group: 'inspector'
    },

    architect_qualification_type: {
      name: 'architect_qualification_type',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'Class 1', enclosed_text: 'X', top: '17.7%', left: '33.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' },
              translation: translation[:classI][:translations] },
        1 => { params: { val: 'Class 2', enclosed_text: 'X', top: '17.7%', left: '46.1%', width: '2%', class_name: 'document-rectangle', input_type: 'button' },
              translation: translation[:classIi][:translations] },
        2 => { params: { val: 'Wooden Structure', enclosed_text: 'X', top: '17.7%', left: '58.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' },
              translation: translation[:woodenStructureClass][:translations] },
        # 3 => { params: { val: 'others', top: '27.3%', left: '27%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      translation_key: 'typeArchitectQualification',
      category: 'inspection',
      group: 'architect'
    },

    architect_type: {
      name: 'architect_type',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'Minister Registration', enclosed_text: 'X', top: '20.8%', left: '51.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' },
              translation: translation[:ministersRegistration][:translations] },
        1 => { params: { val: 'Governor Registration', enclosed_text: 'X', top: '24.4%', left: '51.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' },
              translation: translation[:governorRegistration][:translations] },
        # 2 => { params: { val: 'Wooden Strcture', enclosed_text: 'X', top: '82.7%', left: '58.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        # 3 => { params: { val: 'others', top: '27.3%', left: '27%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      translation_key: 'typeArchitectRegistration',
      category: 'inspection',
      group: 'architect'
    },

    architect_registration_number: {
      name: 'architect_registration_number',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '22.8%', left: '68.2%', width: '16%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'architectRegistrationNumber',
      category: 'inspection',
      group: 'architect'
    },

    architect_registration_jurisdiction: {
      name: 'architect_registration_jurisdiction',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '24.4%', left: '35.1%', width: '16%', text_align: 'right', height: '1.6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'mainOffice',
      category: 'inspection',
      group: 'architect',
      translation_field: 'architect_registration_jurisdiction_translation'
      # translation_record: 'inspections',
      # # # name is the column in model building language
      # translation_column: 'architect_office_registration_jurisdiction',
      # # # translation field is the field in the document that takes the translation
      # translation_field: 'architect_office_registration_jurisdiction_translation',
    },

    architect_registration_jurisdiction_translation: {
      name: 'architect_registration_jurisdiction_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '25.9%', left: '35.1%', width: '16%', text_align: 'right', height: '1.6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'mainOffice',
      category: 'inspection',
      translation_object: true,
      group: 'architect'
    },

    architect_office_name: {
      name: 'architect_office_name',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '27.7%', left: '32%', width: '50%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_record: 'inspections',
      # # name is the column in model building language
      translation_column: 'architect_office_name',
      # # translation field is the field in the document that takes the translation
      translation_field: 'architect_office_name_translation',
      translation_key: 'architectOfficeName',
      category: 'inspection',
      group: 'architect'
      # translation_sibling: 'architect_office_name_translation'
    },

    architect_office_name_translation: {
      name: 'architect_office_name_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '29.3%', left: '32%', width: '50%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'architectOfficeName',
      category: 'inspection',
      translation_object: true,
      group: 'architect'
    },

    architect_office_registration_jurisdiction: {
      name: 'architect_office_registration_jurisdiction',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '31%', left: '37.3%', width: '16%', text_align: 'right', height: '1.6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'architectOfficeRegistrationJurisdiction',
      category: 'inspection',
      group: 'architect',
      translation_field: 'architect_office_registration_jurisdiction_translation'
      # translation_record: 'inspections',
      # # # name is the column in model building language
      # translation_column: 'architect_office_registration_jurisdiction',
      # # # translation field is the field in the document that takes the translation
      # translation_field: 'architect_office_registration_jurisdiction_translation',
    },

    architect_office_registration_jurisdiction_translation: {
      name: 'architect_office_registration_jurisdiction_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '32.6%', left: '37.3%', width: '16%', text_align: 'right', height: '1.6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'architectOfficeRegistrationJurisdiction',
      category: 'inspection',
      translation_object: true,
      group: 'architect'
    },

    architect_office_registration: {
      name: 'architect_office_registration',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '31%', left: '68.2%', width: '16%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'officeRegistrationNumber',
      category: 'inspection',
      group: 'architect'
    },
  #
  # },
  # 10: {
    date_prepared_1: {
      name: 'date_prepared_1',
      input_type: 'date',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '12.3%', left: '74.7%', width: '16%', height: '1.8%', margin: '0', font_size: '13px', class_name: 'document-rectangle', input_type: 'date' } },
      },
      className: 'form-control-document',
      # component: 'input',
      component: 'DocumentChoices',
      # charLimit: 50,
      baseKey: 'date_prepared',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    building_name_3: {
      name: 'building_name_3',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '15.6%', left: '32.4%', width: '53.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      baseKey: 'name',
      translation_record: 'building_languages',
      # # name is the column in model building language
      translation_column: 'name',
      # # translation field is the field in the document that takes the translation
      translation_field: 'building_name_2_translation',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    building_name_3_translation: {
      name: 'building_name_3_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '17.8%', left: '32.4%', width: '53.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
      # baseKey: 'name'
    },

    address_2: {
      name: 'address_2',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '19.8%', left: '31.7%', width: '47%', height: '3.2%', font_size: '13px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      baseKey: 'address',
      translation_record: 'flat_languages',
      translation_field: 'address_2_translation',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    address_2_translation: {
      name: 'address_2_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '23%', left: '31.7%', width: '46.3%', height: '3.2%', font_size: '13px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
      # baseKey: 'address',
    },

    address_check_1: {
      name: 'address_check_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'address_exists', enclosed_text: 'X', top: '19.6%', left: '79.1%', width: '3%', class_name: 'document-rectangle', input_type: 'button' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 1,
      # xbox mean check box toggle with x inside button div
      # xbox: true,
      second_click_off: true,
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    address_site_check_1: {
      name: 'address_site_check_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'address_sit_exists', enclosed_text: 'X', top: '22.9%', left: '79.1%', width: '3%', class_name: 'document-rectangle', input_type: 'button' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 1,
      # xbox: true,
      second_click_off: true,
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    building_name_4: {
      name: 'building_name_4',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '26.6%', left: '43%', width: '24.5%', height: '2%', font_size: '13px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      baseKey: 'name',
      charLimit: 100,
      translation_record: 'building_languages',
      # # name is the column in model building language
      translation_column: 'name',
      # # translation field is the field in the document that takes the translation
      translation_field: 'building_name_3_translation',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    building_name_4_translation: {
      name: 'building_name_4_translation',
      input_type: 'text',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '28.8%', left: '43%', width: '24.5%', height: '2%', font_size: '13px', class_name: 'document-rectangle wrap-textarea', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      baseKey: 'name',
      charLimit: 100,
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
    },

    unit_2: {
      name: 'unit_2',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '27.1%', left: '78.8%', width: '6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      baseKey: 'unit',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # charLimit: 10,
    },

    construction_2: {
      name: 'construction_2',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'RC', enclosed_text: 'X', top: '31.5%', left: '31.2%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'SRC', enclosed_text: 'X', top: '31.5%', left: '49.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Other', enclosed_text: 'X', top: '31.5%', left: '72.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
      },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      baseKey: 'construction',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # borderColor: 'blue'
    },

    floors_1: {
      name: 'floors_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '35.5%', left: '37.5%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # charLimit: 10,
      baseKey: 'floors',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    floors_underground_1: {
      name: 'floors_underground_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '35.5%', left: '50%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # charLimit: 10,
      baseKey: 'floors_underground',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    size_2: {
      name: 'size_2',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '35.5%', left: '79.8%', width: '6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # charLimit: 10,
      baseKey: 'size',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    inspection_date_1: {
      name: 'inspection_date_1',
      input_type: 'date',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '39.4%', left: '32.5%', width: '16%', height: '1.8%', margin: '0', font_size: '13px', class_name: 'document-rectangle', input_type: 'date' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # charLimit: 10,
      baseKey: 'inspection_date',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    flat_type_1: {
      name: 'flat_type_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'single_family', enclosed_text: 'X', top: '41.7%', left: '33%', width: '2%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: ['flat_sub_type_1'], value: '' } },
        1 => { params: { val: 'flat_in_building', enclosed_text: 'X', top: '45.3%', left: '33%', width: '2%', class_name: 'document-rectangle', input_type: 'button' }, inactive: true },
        2 => { params: { val: 'town_house', enclosed_text: 'X', top: '45.3%', left: '33%', width: '2%', class_name: 'document-rectangle', input_type: 'button' }, inactive: true },
        # 3 => { params: { val: 'others', top: '27.3%', left: '27%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      # box: { style: { display: 'flex', flexDirection: 'column', justifyContent: 'center' } },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      baseKey: 'flat_type',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    # dependentKeys changes other fields to value (self is its own val); eg if below single_family clicked, field flat_sub_types turns to ''
    flat_sub_type_1: {
      name: 'flat_sub_type_1',
      input_type: 'string',
      choices: {
        # 0: { params: { val: 'single_family', enclosed_text: 'X', top: '33.5%', left: '33.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        0 => { params: { val: 'town_house', enclosed_text: 'X', top: '45.3%', left: '54.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: ['flat_type_1'], value: 'self' } },
        1 => { params: { val: 'flat_in_building', enclosed_text: 'X', top: '45.3%', left: '70.1%', width: '2%', class_name: 'document-rectangle', input_type: 'button' }, dependentKeys: { fields: ['flat_type_1'], value: 'self' } },
        # 3 => { params: { val: 'others', top: '27.3%', left: '27%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      # box: { style: { display: 'flex', flexDirection: 'column', justifyContent: 'center' } },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      baseKey: 'flat_type',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # dependentValue: 'single_family'
      # changeBaseKey: true,
    },

    degradation_exists_concrete: {
      name: 'degradation_exists_concrete',
      input_type: 'boolean',
      choices: {
        0 => { valName: 'Y', params: { val: true, enclosed_text: 'X', top: '50%', left: '77.1%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { valName: 'N', params: { val: false, enclosed_text: 'X', top: '50%', left: '84.7%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      wooden: false,
      summaryKey: true,
      inactive: true,
      translation_key: 'presenceOfDegradationConcrete',
      category: 'inspection'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    foundation_1: {
      name: 'foundation_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '64.4%', left: '47.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '64.4%', left: '51%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '64.4%', left: '54.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'foundation',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    floor_1: {
      name: 'floor_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '66.9%', left: '47.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '66.9%', left: '51%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '66.9%', left: '54.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'floor',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    pillars_1: {
      name: 'pillars_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '69.4%', left: '47.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '69.4%', left: '51%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '69.4%', left: '54.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'pillars',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    exterior_walls_1: {
      name: 'exterior_walls_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '71.9%', left: '47.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '71.9%', left: '51%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '71.9%', left: '54.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'exterior_walls',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    balcony_1: {
      name: 'balcony_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '74.6%', left: '47.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '74.6%', left: '51%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '74.6%', left: '54.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'balcony',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    halls: {
      name: 'halls',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '77.1%', left: '47.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '77.1%', left: '51%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '77.1%', left: '54.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      translation_key: 'halls',
      category: 'inspection',
      group: 'inspectedParts'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    interior_walls_1: {
      name: 'interior_walls_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '79.7%', left: '47.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '79.7%', left: '51%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '79.7%', left: '54.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'interior_walls',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    ceilings_1: {
      name: 'ceilings_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '82.2%', left: '47.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '82.2%', left: '51%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '82.2%', left: '54.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'ceilings',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    reinforcement_1: {
      name: 'reinforcement_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '87.7%', left: '47.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '87.7%', left: '51%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '87.7%', left: '54.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'reinforcement',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    concrete_compression_1: {
      name: 'concrete_compression_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '90.2%', left: '47.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '90.2%', left: '51%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '90.2%', left: '54.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'concrete_compression',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    exterior_walls_rain_1: {
      name: 'exterior_walls_rain_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '64.5%', left: '76%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '64.5%', left: '79.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '64.5%', left: '83.1%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'exterior_walls_rain',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    interior_walls_rain_1: {
      name: 'interior_walls_rain_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '67%', left: '76%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '67%', left: '79.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '67%', left: '83.1%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'interior_walls_rain',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    ceilings_rain_1: {
      name: 'ceilings_rain_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '69.6%', left: '76%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '69.6%', left: '79.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '69.6%', left: '83.1%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'ceilings_rain',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },

    roof_1: {
      name: 'roof_1',
      input_type: 'boolean',
      choices: {
        0 => { params: { val: 'Yes', enclosed_text: 'X', top: '72.1%', left: '76%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'No', enclosed_text: 'X', top: '72.1%', left: '79.6%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Could not be investigated', enclosed_text: 'X', top: '72.1%', left: '83.1%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      degradationKey: true,
      wooden: false,
      baseKey: 'roof',
      # translation_key: 'mainOffice',
      # category: 'broker'
      # attributes; keep just in case
      # attributes: { names: ['bath_tub'], input_type: 'boolean' }
    },
  #
  # },
  # 11: {
    inspector_name_1: {
      name: 'inspector_name_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '6%', left: '31.4%', width: '47%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      baseKey: 'inspector_name',
      translation_record: 'inspections',
      # # name is the column in model building language
      translation_column: 'inspector_name',
      # # translation field is the field in the document that takes the translation
      translation_field: 'inspector_name_1_translation',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    inspector_name_1_translation: {
      name: 'inspector_name_1_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '7.5%', left: '31.4%', width: '47%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
      # baseKey: 'inspector_name',
    },

    inspector_trainer_1: {
      name: 'inspector_trainer_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '10.5%', left: '31.4%', width: '34.4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      baseKey: 'inspector_trainer',
      translation_record: 'inspections',
      # # name is the column in model building language
      translation_column: 'inspector_trainer',
      # # translation field is the field in the document that takes the translation
      translation_field: 'inspector_trainer_1_translation',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    inspector_trainer_1_translation: {
      name: 'inspector_trainer_1_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '14.1%', left: '31.4%', width: '34.4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
      # baseKey: 'inspector_trainer',
    },

    inspector_certificate_number_1: {
      name: 'inspector_certificate_number_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '12.5%', left: '67%', width: '23.4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      baseKey: 'inspector_certificate_number',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    architect_qualification_type_1: {
      name: 'architect_qualification_type_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'Class 1', enclosed_text: 'X', top: '18.6%', left: '33.1%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'Class 2', enclosed_text: 'X', top: '18.6%', left: '45.5%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        2 => { params: { val: 'Wooden Strcture', enclosed_text: 'X', top: '18.6%', left: '57.9%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        # 3 => { params: { val: 'others', top: '27.3%', left: '27%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      baseKey: 'architect_qualification_type',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    architect_type_1: {
      name: 'architect_type_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'Minister Registration', enclosed_text: 'X', top: '22.8%', left: '50.4%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        1 => { params: { val: 'Governor Registration', enclosed_text: 'X', top: '26.4%', left: '50.4%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        # 2 => { params: { val: 'Wooden Strcture', enclosed_text: 'X', top: '82.7%', left: '58.3%', width: '2%', class_name: 'document-rectangle', input_type: 'button' } },
        # 3 => { params: { val: 'others', top: '27.3%', left: '27%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      baseKey: 'architect_type',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    architect_registration_number_1: {
      name: 'architect_registration_number_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '25%', left: '69%', width: '16%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      baseKey: 'architect_registration_number',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    architect_registration_jurisdiction_1: {
      name: 'architect_registration_jurisdiction_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '26.4%', left: '34.3%', width: '16%', text_align: 'right', height: '1.6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      # translation_key: 'mainOffice',
      # category: 'broker'
      # translation_record: 'inspections',
      # # # name is the column in model building language
      # translation_column: 'architect_office_registration_jurisdiction',
      # # # translation field is the field in the document that takes the translation
      # translation_field: 'architect_office_registration_jurisdiction_translation',
    },

    architect_registration_jurisdiction_1_translation: {
      name: 'architect_registration_jurisdiction_1_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '27.9%', left: '34.3%', width: '16%', text_align: 'right', height: '1.6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
    },

    architect_office_name_1: {
      name: 'architect_office_name_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '29.9%', left: '32%', width: '50%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      baseKey: 'architect_office_name',
      translation_record: 'inspections',
      # # name is the column in model building language
      translation_column: 'architect_office_name',
      # # translation field is the field in the document that takes the translation
      translation_field: 'architect_office_name_1_translation',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },

    architect_office_name_1_translation: {
      name: 'architect_office_name_1_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '31.5%', left: '32%', width: '50%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
      # baseKey: 'architect_office_name',
    },

    architect_office_registration_jurisdiction_1: {
      name: 'architect_office_registration_jurisdiction_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '33.9%', left: '37.1%', width: '16%', text_align: 'right', height: '1.6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      # translation_key: 'mainOffice',
      # category: 'broker'
      # translation_record: 'inspections',
      # # # name is the column in model building language
      # translation_column: 'architect_office_registration_jurisdiction',
      # # # translation field is the field in the document that takes the translation
      # translation_field: 'architect_office_registration_jurisdiction_translation',
    },

    architect_office_registration_jurisdiction_1_translation: {
      name: 'architect_office_registration_jurisdiction_1_translation',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '35.1%', left: '37.1%', width: '16%', text_align: 'right', height: '1.6%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      # translation_key: 'mainOffice',
      # category: 'broker',
      # translation_object: true
    },

    architect_office_registration_1: {
      name: 'architect_office_registration_1',
      input_type: 'string',
      choices: {
        0 => { params: { val: 'inputFieldValue', top: '33.8%', left: '69%', width: '16%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      charLimit: 100,
      baseKey: 'architect_office_registration',
      # translation_key: 'mainOffice',
      # category: 'broker'
    },
# },
  };
    # object = important_points_explanation
  #   return object
  # end
end

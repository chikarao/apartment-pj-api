#!!!! IMORTANT: Need to get constants: Building, Amenities etc for selectChoices
# IMPORTANT: flat_owner is different from owner. flat_owner is the actual owner of the flat, not the landlord (termed owner here)who can be other than the actual owner
module FixedTermRentalContractBilingualAll
  # CONSTANT for fetch_translation and save and create agreement in booking
  # def important_points_explanation_translation
  # include ImportantPointsExplanationTranslation
  include DocumentConstants
  building = DocumentConstants::BUILDING
  amenities = DocumentConstants::AMENITIES
  flat = DocumentConstants::FLAT_FOR_DOCUMENTS
  rent_payment = DocumentConstants::RENT_PAYMENT
  facility_included = DocumentConstants::INCLUDED_CHOICES

    OBJECT =
    {
      document_name: {
          name: 'document_name',
          # className: 'form-control-document',
          # change from input componnet use DocumentChoices
          component: 'DocumentChoices',
          borderColor: 'lightgray',
          choices: {
            :documentAttributes => {
              params: {
                  val: 'documentAttributes',
                  top: '2%',
                  left: '37%',
                  width: '30%',
                  # change from input componnet use document-rectange
                  class_name: 'document-rectangle',
                  # !!! height works only with px
                  # height: '23px',
                  input_type: 'string',
                }
              }
           },
          required: true,
          # translation_key: 'documentTitle',
          # category: 'document'
        },

        name: {
            name: 'name',
            # className: 'form-control-document',
            # change from input componnet use DocumentChoices
            component: 'DocumentChoices',
            borderColor: 'lightgray',
            choices: {
              :inputFieldValue => {
                  params: {
                      val: 'inputFieldValue',
                      top: '16.5%',
                      left: '30%',
                      width: '59.5%',
                      # change from input componnet use document-rectange
                      class_name: 'document-rectangle',
                      # !!! height works only with px
                      # height: '23px',
                      input_type: 'string',
                    }
                  }
                },
            required: true,
            # when there is a translation available for key, use below
            # translation record is the array of building languages associated with flat.building
            translation_record: 'building_languages',
            # name is the column in model building language
            translation_column: 'name',
            # translation field is the field in the document that takes the translation
            translation_field: 'name_translation',
            # translation_object_key: 'name',
            # translation_key for getting object from DocumentTranslationFixedTermAll
            translation_key: 'buildingName',
            # template_element_object divided into category and group
            category: 'building',
            # initialvalues_method_key is for using in get_initialvalues_object_fixed_term_contract_template.js
            initialvalues_method_key: 'building'
          },

          name_translation: {
              name: 'name_translation',
              # className: 'form-control-document',
              # change from input componnet use DocumentChoices
              component: 'DocumentChoices',
              borderColor: 'lightgray',
              choices: {
                  :inputFieldValue => {
                    params: {
                        val: 'inputFieldValue',
                        top: '18.5%',
                        left: '30%',
                        width: '59.5%',
                        # change from input componnet use document-rectange
                        class_name: 'document-rectangle',
                        # !!! height works only with px
                        # height: '23px',
                        input_type: 'string',
                      }
                    }
                  },
              required: true,
              translation_key: 'buildingName',
              # template_element_object divided into category and group
              category: 'building',
              # translation_object for use in template create box grouping and in get_initialvalues_object_fixed_term_contract_template.js
              translation_object: true,
              initialvalues_method_key: 'building'
            },

          address: {
              name: 'address',
              # input_type: 'string',
              # className: 'form-control-document',
              component: 'DocumentChoices',
              borderColor: 'lightgray',
              choices: {
                :inputFieldValue => {
                  params: {
                      val: 'inputFieldValue',
                      top: '20.9%',
                      left: '30%',
                      width: '59.5%',
                      # height: '23px',
                      class_name: 'document-rectangle',
                      input_type: 'string',
                    }
                  }
                },
              # required: true
              translation_record: 'flat_languages',
              # name is the column in model building language
              # translation_column: 'name',
              # translation field is the field in the document that takes the translation
              translation_field: 'address_translation',
              translation_key: 'address',
              category: 'flat',
              initialvalues_method_key: 'address'
            },

          address_translation: {
              name: 'address_translation',
              # input_type: 'string',
              # className: 'form-control-document',
              component: 'DocumentChoices',
              borderColor: 'lightgray',
              choices: {
                :inputFieldValue => {
                  params: {
                      val: 'inputFieldValue',
                      top: '23%',
                      left: '30%',
                      width: '59.5%',
                      # height: '23px',
                      class_name: 'document-rectangle',
                      input_type: 'string',
                    }
                  }
                },
              # required: true
              translation_key: 'address',
              category: 'flat',
              translation_object: true,
              initialvalues_method_key: 'address'
          },

        flat_type: {
          name: 'flat_type',
          input_type: 'string',
          choices: {
            :flatInBuilding => { params: { val: 'flatInBuilding', top: '25%', left: '31.6%', width: '10%', height: '1.6%', class_name: 'document-rectangle', input_type: 'button' },
                  translation: flat[:flat_type][:choices][:flatInBuilding] },
            :townHouse => { params: { val: 'townHouse', top: '28.7%', left: '31.6%', width: '10%', height: '1.6%', class_name: 'document-rectangle', input_type: 'button' },
                  translation: flat[:flat_type][:choices][:townHouse] },
            :singleFamily => { params: { val: 'singleFamily', top: '32.3%', left: '31.6%', width: '10%', height: '1.6%', class_name: 'document-rectangle', input_type: 'button' },
                  translation: flat[:flat_type][:choices][:singleFamily] },
            :others => { params: { val: 'others', top: '36.3%', left: '31.6%', width: '10%', height: '1.6%', class_name: 'document-rectangle', input_type: 'button' },
                  translation: flat[:flat_type][:choices][:others] }
          },
          box: { style: { display: 'flex', flexDirection: 'column', justifyContent: 'center' } },
          className: 'form-control-document',
          height: '23px',
          component: 'DocumentChoices',
          translation_key: 'buildingType',
          category: 'flat',
          initialvalues_method_key: 'flat'
        },


        construction: {
          name: 'construction',
          input_type: 'string',
          choices: {
            :wooden => { params: { val: 'wooden', top: '25%', left: '55.5%', width: '10%', class_name: 'document-rectangle', input_type: 'button' },
                  nonTemplate: true },
            :inputFieldValue => { params: { val: 'inputFieldValue', top: '30.3%', left: '57.6%', width: '10%', height: '1.8%', class_name: 'document-rectangle', input_type: 'string', text_align: 'right' },
                  selectChoices: building[:construction][:choices],
            # selectChoices: Building.construction.choices
            }
          },
          box: { style: { display: 'flex', flexDirection: 'column', justifyContent: 'center' } },
          className: 'form-control-document',
          height: '23px',
          component: 'DocumentChoices',
          required: true,
          # hybrid_field if there are multipe types of fields eg button and input
          hybrid_field: true,
          translation_key: 'construction',
          category: 'building',
          initialvalues_method_key: 'building',
          language_independent: true
          # group: 'construction'
        },

        floors: {
          name: 'floors',
          input_type: 'string',
          choices: {
            :inputFieldValue => { params: { val: 'inputFieldValue', top: '32%', left: '63%', width: '4%', class_name: 'document-rectangle', input_type: 'string', text_align: 'right' } },
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'stories',
          category: 'building',
          initialvalues_method_key: 'building'
        },

        year_built: {
          name: 'year_built',
          input_type: 'string',
          choices: {
            :inputFieldValue => { params: { val: 'inputFieldValue', top: '29.1%', left: '81%', width: '5%', class_name: 'document-rectangle', input_type: 'string', text_align: 'right' } },
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'yearBuilt',
          category: 'building',
          initialvalues_method_key: 'building'
        },

        units: {
          name: 'units',
          input_type: 'string',
          choices: {
            :inputFieldValue => { params: { val: 'inputFieldValue', top: '35.5%', left: '63.5%', width: '5%', class_name: 'document-rectangle', input_type: 'string', text_align: 'right' } },
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'numberOfUnits',
          category: 'building',
          initialvalues_method_key: 'building'
        },

        last_renovation_year: {
          name: 'last_renovation_year',
          input_type: 'string',
          choices: {
            :inputFieldValue => { params: { val: 'inputFieldValue', top: '33.3%', left: '77.1%', width: '5%', class_name: 'document-rectangle', input_type: 'string', text_align: 'right' } },
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'majorRenovation',
          category: 'flat',
          initialvalues_method_key: 'building'
        },

        unit: {
          name: 'unit',
          input_type: 'string',
          choices: {
            :inputFieldValue => { params: { val: 'inputFieldValue', top: '39.6%', left: '35%', width: '5%', class_name: 'document-rectangle', input_type: 'string', text_align: 'right' } },
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'unit',
          category: 'flat',
          initialvalues_method_key: 'flat'
        },

        rooms: {
          name: 'rooms',
          input_type: 'string',
          choices: {
              :inputFieldValue => { params: { val: 'inputFieldValue', top: '39.6%', left: '59%', width: '5%', class_name: 'document-rectangle', input_type: 'string', text_align: 'right' } },
            },
            className: 'form-control-document',
            component: 'DocumentChoices',
            translation_key: 'rooms',
            category: 'flat',
            initialvalues_method_key: 'flat'
        },

        layout: {
            name: 'layout',
            input_type: 'string',
            choices: {
              :ldk => { params: { val: 'ldk', top: '39.6%', left: '64.3%', width: '5%', class_name: 'document-rectangle', input_type: 'button' } },
              :dk => { params: { val: 'dk', top: '39.6%', left: '69.4%', width: '4%', class_name: 'document-rectangle', input_type: 'button' } },
              :k => { params: { val: 'k', top: '39.6%', left: '73.4%', width: '3%', class_name: 'document-rectangle', input_type: 'button' } },
              :oneRoom => { params: { val: 'oneRoom', top: '39.6%', left: '76.5%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } }
            },
            box: { style: { display: 'flex', flexDirection: 'column', justifyContent: 'center' } },
            className: 'form-control-document',
            height: '23px',
            component: 'DocumentChoices',
            translation_key: 'layout',
            category: 'flat',
            initialvalues_method_key: 'flat'
            # borderColor: 'blue'
          },

        size: {
          name: 'size',
          input_type: 'string',
          choices: {
              :inputFieldValue => { params: { val: 'inputFieldValue', top: '42.7%', left: '46%', width: '5%', class_name: 'document-rectangle', input_type: 'string', text_align: 'right' } },
            },
            className: 'form-control-document',
            component: 'DocumentChoices',
            translation_key: 'floorSpace',
            category: 'flat',
            initialvalues_method_key: 'flat'
        },

        balcony_size: {
          name: 'balcony_size',
          input_type: 'string',
          choices: {
              :inputFieldValue => { params: { val: 'inputFieldValue', top: '42.5%', left: '79.7%', width: '5%', class_name: 'document-rectangle', input_type: 'string', text_align: 'right' } },
            },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'balcony',
          category: 'flat',
          initialvalues_method_key: 'flat'
        },


        toilet: {
          name: 'toilet',
          input_type: 'string',
          choices: {
            :dedicatedFlushingToilet => { params: { val: 'dedicatedFlushingToilet', top: '45.5%', left: '58.4%', width: '5%', class_name: 'document-rectangle', input_type: 'button' },
                  translation: flat[:toilet][:choices][:dedicatedFlushingToilet] },
            :dedicatedNonFlushingToilet => { params: { val: 'dedicatedNonFlushingToilet', top: '45.5%', left: '63.7%', width: '7%', class_name: 'document-rectangle', input_type: 'button' },
                  translation: flat[:toilet][:choices][:dedicatedNonFlushingToilet] },
            :sharedFlushingToilet => { params: { val: 'sharedFlushingToilet', top: '45.5%', left: '77%', width: '5%', class_name: 'document-rectangle', input_type: 'button' },
                  translation: flat[:toilet][:choices][:sharedFlushingToilet] },
            :sharedNonFlushingToilet => { params: { val: 'sharedNonFlushingToilet', top: '45.5%', left: '82%', width: '7%', class_name: 'document-rectangle', input_type: 'button' },
                  translation: flat[:toilet][:choices][:sharedNonFlushingToilet] }
          },
          className: 'form-control-document',
          height: '23px',
          component: 'DocumentChoices',
          # borderColor: 'blue'
          translation_key: 'toilet',
          category: 'flat',
          initialvalues_method_key: 'flat'
        },

        # !!!!!!bath is assuming if there is a shower, there is a bathingroom
        bath_tub: {
          name: 'bath_tub',
          input_type: 'boolean',
          choices: {
            0 => { valName: 'y', params: { val: true, top: '50.9%', left: '53.45%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
            1 => { valName: 'n', params: { val: false, top: '50.9%', left: '57.15%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          # attributes; keep just in case
          attributes: { names: ['bath_tub'], input_type: 'boolean' },
          translation_key: 'bathTub',
          category: 'flat',
          group: 'amenities',
          initialvalues_method_key: 'amenities'
        },

        shower: {
          name: 'shower',
          input_type: 'boolean',
          choices: {
            # add 1.5% to top
            0 => { valName: 'y', params: { val: true, top: '53.8%', left: '53.45%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
            1 => { valName: 'n', params: { val: false, top: '53.8%', left: '57.15%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'shower',
          category: 'flat',
          group: 'amenities',
          initialvalues_method_key: 'amenities'
        },

        wash_basin: {
          name: 'wash_basin',
          input_type: 'boolean',
          choices: {
            # add 1.5% to top
            0 => { valName: 'y', params: { val: true, top: '56.7%', left: '53.45%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
            1 => { valName: 'n', params: { val: false, top: '56.7%', left: '57.15%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'washBasin',
          category: 'flat',
          group: 'amenities',
          initialvalues_method_key: 'amenities'
        },

        washer_dryer_area: {
          name: 'washer_dryer_area',
          input_type: 'boolean',
          choices: {
            # add 1.5% to top
            0 => { valName: 'y', params: { val: true, top: '59.4%', left: '53.45%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
            1 => { valName: 'n', params: { val: false, top: '59.4%', left: '57.15%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'washerArea',
          category: 'flat',
          group: 'amenities',
          initialvalues_method_key: 'amenities'
        },

        hot_water: {
          name: 'hot_water',
          input_type: 'boolean',
          choices: {
            # add 1.5% to top
            0 => { valName: 'y', params: { val: true, top: '62.3%', left: '53.45%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
            1 => { valName: 'n', params: { val: false, top: '62.3%', left: '57.15%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'waterHeater',
          category: 'flat',
          group: 'amenities',
          initialvalues_method_key: 'amenities'
        },

        kitchen_grill: {
          name: 'kitchen_grill',
          input_type: 'boolean',
          choices: {
            # add 1.5% to top
            0 => { valName: 'y', params: { val: true, top: '65.1%', left: '53.45%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
            1 => { valName: 'n', params: { val: false, top: '65.1%', left: '57.15%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'kitchenStove',
          category: 'flat',
          group: 'amenities',
          initialvalues_method_key: 'amenities'
        },

        parcel_delivery_box: {
          name: 'parcel_delivery_box',
          input_type: 'boolean',
          choices: {
            # add 1.5% to top
            0 => { valName: 'y', params: { val: true, top: '67.8%', left: '53.45%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
            1 => { valName: 'n', params: { val: false, top: '67.8%', left: '57.15%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
          },
          className: 'form-control-document',
          component: 'DocumentChoices',
          translation_key: 'parcelBox',
          category: 'flat',
          group: 'amenities',
          initialvalues_method_key: 'amenities'
      },

      ac: {
        name: 'ac',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          0 => { valName: 'y', params: { val: true, top: '50.8%', left: '82.5%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
          1 => { valName: 'n', params: { val: false, top: '50.8%', left: '86.3%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'ac',
        category: 'flat',
        group: 'amenities',
        initialvalues_method_key: 'amenities'
      },

      lighting_fixed: {
        name: 'lighting_fixed',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          0 => { valName: 'y', params: { val: true, top: '53.7%', left: '82.5%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
          1 => { valName: 'n', params: { val: false, top: '53.7%', left: '86.3%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'fixedLighting',
        category: 'flat',
        group: 'amenities',
        initialvalues_method_key: 'amenities'
      },

      auto_lock: {
        name: 'auto_lock',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          0 => { valName: 'y', params: { val: true, top: '56.6%', left: '82.5%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
          1 => { valName: 'n', params: { val: false, top: '56.6%', left: '86.3%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'autoLock',
        category: 'flat',
        group: 'amenities',
        initialvalues_method_key: 'amenities'
      },
      # cable_tv includes digital
      cable_tv: {
        name: 'cable_tv',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          0 => { valName: 'y', params: { val: true, top: '59.3%', left: '82.5%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
          1 => { valName: 'n', params: { val: false, top: '59.3%', left: '86.3%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'digitalTv',
        category: 'flat',
        group: 'amenities',
        initialvalues_method_key: 'amenities'
      },

      internet_ready: {
        name: 'internet_ready',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          0 => { valName: 'y', params: { val: true, top: '62.2%', left: '82.5%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
          1 => { valName: 'n', params: { val: false, top: '62.2%', left: '86.3%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'internetReady',
        category: 'flat',
        group: 'amenities',
        initialvalues_method_key: 'amenities'
      },

      mail_box: {
        name: 'mail_box',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          0 => { valName: 'y', params: { val: true, top: '65%', left: '82.5%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
          1 => { valName: 'n', params: { val: false, top: '65%', left: '86.3%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'mailBox',
        category: 'flat',
        group: 'amenities',
        initialvalues_method_key: 'amenities'
      },

      lock_key: {
        name: 'lock_key',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          0 => { valName: 'y', params: { val: true, top: '70.8%', left: '53.45%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } },
          1 => { valName: 'n', params: { val: false, top: '70.8%', left: '57.15%', width: '2.7%', class_name: 'document-circle', input_type: 'button' } }
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'lock_key',
        category: 'flat',
        group: 'amenities',
        initialvalues_method_key: 'amenities'
      },

      key_number: {
        name: 'key_number',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '73%', left: '36.4%', width: '13%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'key',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      keys: {
        name: 'keys',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '73%', left: '62.5%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'sets',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      power_usage_amount: {
        name: 'power_usage_amount',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '75.9%', left: '53%', width: '7%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'electricCapacity',
        category: 'building',
        initialvalues_method_key: 'building'
      },

      gas: {
        name: 'gas',
        input_type: 'string',
        choices: {
          :publicGas => { params: { val: 'publicGas', top: '79.6%', left: '50.5%', width: '8%', class_name: 'document-rectangle', input_type: 'button' },
                          translation: building[:gas][:choices][:publicGas]},
          :propaneGas => { params: { val: 'propaneGas', top: '79.6%', left: '59.6%', width: '12%', class_name: 'document-rectangle', input_type: 'button' },
                          translation: building[:gas][:choices][:propaneGas]},
          :none => { params: { val: 'none', top: '79.6%', left: '72.7%', width: '4%', class_name: 'document-rectangle', input_type: 'button' },
                          translation: building[:gas][:choices][:none]}
        },
        className: 'form-control-document',
        height: '23px',
        component: 'DocumentChoices',
        translation_key: 'gas',
        category: 'building',
        initialvalues_method_key: 'building'
        # borderColor: 'blue'
      },

      water: {
        name: 'water',
        input_type: 'string',
        choices: {
          :publicWater => { params: { val: 'publicWater', top: '83.6%', left: '47.5%', width: '15.5%', class_name: 'document-rectangle', input_type: 'button' },
                translation: building[:water][:choices][:publicWater] },
          :tank => { params: { val: 'tank', top: '83.6%', left: '63.9%', width: '6.7%', class_name: 'document-rectangle', input_type: 'button' },
                translation: building[:water][:choices][:waterTank] },
          :well => { params: { val: 'well', top: '83.6%', left: '71.5%', width: '6.6%', class_name: 'document-rectangle', input_type: 'button' },
                translation: building[:water][:choices][:well] },
        },
        className: 'form-control-document',
        height: '23px',
        component: 'DocumentChoices',
        # borderColor: 'blue'
        category: 'building',
        translation_key: 'water',
        initialvalues_method_key: 'building'
      },

      sewage: {
        name: 'sewage',
        input_type: 'string',
        choices: {
          :publicSewer => { params: { val: 'publicSewer', top: '87.6%', left: '50%', width: '10.5%', class_name: 'document-rectangle', input_type: 'button' },
                translation: building[:sewage][:choices][:publicSewer]},
          :septicTank => { params: { val: 'septicTank', top: '87.6%', left: '61%', width: '6.7%', class_name: 'document-rectangle', input_type: 'button' },
                translation: building[:sewage][:choices][:septicTank]},
          :none => { params: { val: 'none', top: '87.6%', left: '69.5%', width: '3%', class_name: 'document-rectangle', input_type: 'button' },
                translation: building[:sewage][:choices][:none]},
        },
        className: 'form-control-document',
        height: '23px',
        component: 'DocumentChoices',
        # borderColor: 'blue',
        translation_key: 'sewage',
        category: 'building',
        initialvalues_method_key: 'building'
      },
  # }, # end of 1
  # 2: {
      parking_included: {
        name: 'parking_included',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          true => { valName: 'y', params: { val: true, top: '9%', left: '45%', width: '4.3%', class_name: 'document-rectangle', input_type: 'button' },
                                        translation: facility_included[1]},
          false => { valName: 'n', params: { val: false, top: '9%', left: '50.7%', width: '8%', class_name: 'document-rectangle', input_type: 'button' },
                                        translation: facility_included[0]}
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'parkingIncluded',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      parking_spaces: {
        name: 'parking_spaces',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '9%', left: '61.6%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'parkingSpaces',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      parking_space_number: {
        name: 'parking_space_number',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '9%', left: '79.1%', width: '9%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'parkingNumber',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      bicycle_parking_included: {
        name: 'bicycle_parking_included',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          true => { valName: 'y', params: { val: true, top: '12.5%', left: '45%', width: '4.3%', class_name: 'document-rectangle', input_type: 'button' },
                                translation: facility_included[1]},
          false => { valName: 'n', params: { val: false, top: '12.5%', left: '50.7%', width: '8%', class_name: 'document-rectangle', input_type: 'button' },
                                translation: facility_included[0]}
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'bicycleParkingIncluded',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      bicycle_parking_spaces: {
        name: 'bicycle_parking_spaces',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '12.5%', left: '61.6%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'bicycleParkingSpaces',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      bicycle_parking_space_number: {
        name: 'bicycle_parking_space_number',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '12.5%', left: '79.1%', width: '9%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'bicycleParkingNumber',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      motorcycle_parking_included: {
        name: 'motorcycle_parking_included',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          true => { valName: 'y', params: { val: true, top: '16%', left: '45%', width: '4.3%', class_name: 'document-rectangle', input_type: 'button' },
                                        translation: facility_included[1]},
          false => { valName: 'n', params: { val: false, top: '16%', left: '50.7%', width: '8%', class_name: 'document-rectangle', input_type: 'button' },
                                        translation: facility_included[0]}
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'motocycleParkingIncluded',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      motorcycle_parking_spaces: {
        name: 'motorcycle_parking_spaces',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '16%', left: '61.6%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'motocycleParkingSpaces',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      motorcycle_parking_space_number: {
        name: 'motorcycle_parking_space_number',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '16%', left: '79.1%', width: '9%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'motocycleParkingNumber',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      storage_included: {
        name: 'storage_included',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          true => { valName: 'y', params: { val: true, top: '19.5%', left: '45%', width: '4.3%', class_name: 'document-rectangle', input_type: 'button' },
                                        translation: facility_included[1]},
          false => { valName: 'n', params: { val: false, top: '19.5%', left: '50.7%', width: '8%', class_name: 'document-rectangle', input_type: 'button' },
                                        translation: facility_included[0]}
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'storageIncluded',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      storage_spaces: {
        name: 'storage_spaces',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '19.5%', left: '61.6%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'storageSpaces',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      storage_space_number: {
        name: 'storage_space_number',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '19.5%', left: '79.1%', width: '9%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'storageNumber',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      dedicated_yard: {
        name: 'dedicated_yard',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          true => { valName: 'y', params: { val: true, top: '22.9%', left: '45%', width: '4.3%', class_name: 'document-rectangle', input_type: 'button' },
                                        translation: facility_included[1]},
          false => { valName: 'n', params: { val: false, top: '22.9%', left: '50.7%', width: '8%', class_name: 'document-rectangle', input_type: 'button' },
                                        translation: facility_included[0]}
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'ownYard',
        category: 'flat',
        group: 'amenities',
        initialvalues_method_key: 'flat'
      },

      other_facility: {
        name: 'other_facility',
        input_type: 'boolean',
        choices: {
          # add 1.5% to top
          true => { valName: 'y', params: { val: true, top: '25.9%', left: '45%', width: '4.3%', class_name: 'document-rectangle', input_type: 'button' },
                                        translation: facility_included[1]},
          false => { valName: 'n', params: { val: false, top: '25.9%', left: '50.7%', width: '8%', class_name: 'document-rectangle', input_type: 'button' },
                                        translation: facility_included[0]}
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'otherFacility',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      other_facility_name: {
        name: 'other_facility_name',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '25.9%', left: '30%', width: '11.4%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'otherFacility',
        category: 'flat',
        initialvalues_method_key: 'flat'
      },

      from_year: {
        name: 'from_year',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '34.5%', left: '27%', width: '5%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'yearFrom',
        category: 'agreement',
        group: 'fromDate',
        initialvalues_method_key: 'booking'
      },

      from_month: {
        name: 'from_month',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '34.5%', left: '40%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'monthFrom',
        category: 'agreement',
        group: 'fromDate',
        initialvalues_method_key: 'booking'
      },

      from_day: {
        name: 'from_day',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '34.5%', left: '51.2%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'dayFrom',
        category: 'agreement',
        group: 'fromDate',
        initialvalues_method_key: 'booking'
      },

      to_year: {
        name: 'to_year',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '37.3%', left: '27%', width: '5%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'yearTo',
        category: 'agreement',
        group: 'toDate',
        initialvalues_method_key: 'booking'
      },

      to_month: {
        name: 'to_month',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '37.3%', left: '40%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'monthTo',
        category: 'agreement',
        group: 'toDate',
        initialvalues_method_key: 'booking'
      },

      to_day: {
        name: 'to_day',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '37.3%', left: '51.2%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'dayTo',
        category: 'agreement',
        group: 'toDate',
        initialvalues_method_key: 'booking'
      },

      contract_length_years: {
        name: 'contract_length_years',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '36%', left: '72.6%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'yearsContract',
        category: 'agreement',
        initialvalues_method_key: 'booking'
      },

      contract_length_months: {
        name: 'contract_length_months',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '36%', left: '80.3%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'monthsContract',
        category: 'agreement',
        initialvalues_method_key: 'booking'
      },

      notice_from_year: {
        name: 'notice_from_year',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '40.3%', left: '42.5%', width: '5%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'noticeYearFrom',
        category: 'agreement',
        group: 'noticeFrom',
        initialvalues_method_key: 'booking'
      },

      notice_from_month: {
        name: 'notice_from_month',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '40.3%', left: '50%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'noticeMonthFrom',
        category: 'agreement',
        group: 'noticeFrom',
        initialvalues_method_key: 'booking'
      },

      notice_from_day: {
        name: 'notice_from_day',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '40.3%', left: '55.5%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'noticeDayFrom',
        category: 'agreement',
        group: 'noticeFrom',
        initialvalues_method_key: 'booking'
      },

      notice_to_year: {
        name: 'notice_to_year',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '40.3%', left: '64.5%', width: '5%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'noticeYearTo',
        category: 'agreement',
        group: 'noticeTo',
        initialvalues_method_key: 'booking'
      },

      notice_to_month: {
        name: 'notice_to_month',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '40.3%', left: '72%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'noticeMonthTo',
        category: 'agreement',
        group: 'noticeTo',
        initialvalues_method_key: 'booking'
      },

      notice_to_day: {
        name: 'notice_to_day',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '40.3%', left: '77.5%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'noticeDayTo',
        category: 'agreement',
        group: 'noticeTo',
        initialvalues_method_key: 'booking'
      },

      final_rent: {
      # price_per_month: {
        name: 'final_rent',
        # name: 'price_per_month',
        className: 'form-control-document',
        # input_type: 'string',
        component: 'DocumentChoices',
        borderColor: 'lightgray',
        choices: {
          :inputFieldValue => {
            params: {
              val: 'inputFieldValue',
              top: '52.4%',
              left: '25.5%',
              width: '8%',
              class_name: 'document-rectangle',
              # !!! height works only with px
              # height: '23px',
              input_type: 'string'
            }
          }
        },
        translation_key: 'rentAndOthers',
        category: 'agreement',
        initialvalues_method_key: 'booking'
      },

      payment_due_date: {
        name: 'payment_due_date',
        className: 'form-control-document',
        # component: 'input',
        component: 'DocumentChoices',
        # input_type: 'string',
        borderColor: 'lightgray',
        choices: {
          :inputFieldValue => {
            params: {
              val: 'inputFieldValue',
              top: '52.1%',
              left: '42.5%',
              width: '4.2%',
              class_name: 'document-rectangle',
              # !!! height works only with px
              # height: '23px',
              input_type: 'string'
            }
          }
        },
        translation_key: 'rentDueDateEachMonth',
        category: 'agreement',
        initialvalues_method_key: 'flat'
      },

      management_fees: {
        # its for management fees
        name: 'management_fees',
        className: 'form-control-document',
        component: 'DocumentChoices',
        # input_type: 'string',
        # component: 'input',
        borderColor: 'lightgray',
        choices: {
          :inputFieldValue => {
            params: {
              val: 'inputFieldValue',
              top: '78.6%',
              left: '24.5%',
              width: '8%',
              class_name: 'document-rectangle',
              # !!! height works only with px
              # height: '23px',
              input_type: 'string'
            }
          }
        },
        translation_key: 'fees',
        category: 'agreement',
        initialvalues_method_key: 'flat'
      },

      fees_payment_due_date: {
        name: 'fees_payment_due_date',
        className: 'form-control-document',
        component: 'DocumentChoices',
        # className: 'form-control-document',
        # component: 'input',
        # input_type: 'string',
        borderColor: 'lightgray',
        choices: {
          :inputFieldValue => {
            params: {
              val: 'inputFieldValue',
              top: '68.3%',
              left: '42.5%',
              width: '4.2%',
              # !!! height works only with px
              # height: '23px',
              class_name: 'document-rectangle',
              input_type: 'string'
            }
          }
        },
        translation_key: 'feesDueDateEachMonth',
        category: 'agreement',
        initialvalues_method_key: 'flat',
        actual_record_key: 'payment_due_date',
        language_independent: true
      },

      bank_name: {
        name: 'bank_name',
        className: 'form-control-document',
        component: 'DocumentChoices',
        # input_type: 'string',
        # className: 'form-control-document',
        # component: 'input',
        borderColor: 'lightgray',
        choices: {
          :inputFieldValue => {
            params: {
              val: 'inputFieldValue',
              top: '51.4%',
              left: '59.5%',
              width: '29.5%',
              # !!! height works only with px
              class_name: 'document-rectangle',
              # height: '23px',
              input_type: 'string'
            }
          }
        },
        translation_key: 'bankName',
        category: 'agreement',
        initialvalues_method_key: 'bankAccount'
      },

      bank_name_english: {
        name: 'bank_name_english',
        className: 'form-control-document',
        component: 'DocumentChoices',
        # input_type: 'string',
        # className: 'form-control-document',
        # component: 'input',
        borderColor: 'lightgray',
        choices: {
          :inputFieldValue => {
            params: {
              val: 'inputFieldValue',
              top: '54.5%',
              left: '59.5%',
              width: '29.5%',
              # !!! height works only with px
              class_name: 'document-rectangle',
              # height: '23px',
              input_type: 'string'
            }
          }
        },
        translation_key: 'bankNameEnglish',
        category: 'agreement',
        initialvalues_method_key: 'bankAccount'
      },

      account_type: {
        name: 'account_type',
        input_type: 'string',
        choices: {
          :ordinary => { params: { val: 'ordinary', top: '56.5%', left: '64.6%', width: '5%', class_name: 'document-rectangle', input_type: 'button' } },
          :current => { params: { val: 'current', top: '56.5%', left: '70.3%', width: '5%', class_name: 'document-rectangle', input_type: 'button' } },
        },
        className: 'form-control-document',
        # height: '23px',
        component: 'DocumentChoices',
        translation_key: 'accountType',
        category: 'agreement',
        initialvalues_method_key: 'bankAccount'
        # borderColor: 'blue'
      },

      account_number: {
        name: 'account_number',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '59.7%', left: '69.5%', width: '20%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'accountNumber',
        category: 'agreement',
        initialvalues_method_key: 'bankAccount'
      },

      swift: {
        name: 'swift',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '64.7%', left: '59.5%', width: '20%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'swift',
        category: 'agreement',
        initialvalues_method_key: 'bankAccount'
      },

      account_name: {
        name: 'account_name',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '68.2%', left: '59.8%', width: '19%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'accountName',
        category: 'agreement',
        initialvalues_method_key: 'bankAccount'
      },

      account_name_english: {
        name: 'account_name_english',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '71.4%', left: '59.8%', width: '19%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'accountNameAlphabet',
        category: 'agreement',
        initialvalues_method_key: 'bankAccount'
      },

      transfer_fee_paid_by: {
        name: 'transfer_fee_paid_by',
        input_type: 'string',
        choices: {
          :owner => { params: { val: 'owner', top: '73.4%', left: '75.6%', width: '5%', class_name: 'document-rectangle', input_type: 'button' } },
          :tenant => { params: { val: 'tenant', top: '73.4%', left: '81.3%', width: '5%', class_name: 'document-rectangle', input_type: 'button' } },
        },
        className: 'form-control-document',
        height: '23px',
        component: 'DocumentChoices',
        translation_key: 'transferFeePaidBy',
        category: 'agreement',
        initialvalues_method_key: 'flat'
        # borderColor: 'blue'
      },

      rent_payment_method: {
        name: 'rent_payment_method',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '77.2%', left: '67.5%', width: '22%', class_name: 'document-rectangle', input_type: 'string' },
                                selectChoices: rent_payment[:rent_payment_method][:choices]
                              },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'rentPaymentMethod',
        category: 'agreement',
        group: 'rent_payment_method',
        initialvalues_method_key: 'flat'
      },

      # rent_payment_method_translation: {
      #   name: 'rent_payment_method_translation',
      #   input_type: 'string',
      #   choices: {
      #     # add 1.5% to top
      #     :inputFieldValue => { params: { val: 'inputFieldValue', top: '77.2%', left: '67.5%', width: '22%', class_name: 'document-rectangle', input_type: 'string' } },
      #   },
      #   className: 'form-control-document',
      #   component: 'DocumentChoices'
      # },

      final_deposit: {
      # deposit: {
        # in MONTHS
        name: 'final_deposit',
        # name: 'deposit',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '82%', left: '27.5%', width: '3.5%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'rentDepositX',
        category: 'agreement',
        initialvalues_method_key: 'booking'
      },

      deposit_amount: {
        # calculated off of deposit months
        name: 'deposit_amount',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '82%', left: '53.8%', width: '10%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'deposit',
        category: 'agreement',
        initialvalues_method_key: 'booking'
      },

      facilities_usage_fee: {
        name: 'facilities_usage_fee',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '85.8%', left: '29.8%', width: '20%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'facilityUsageFee',
        category: 'agreement',
        initialvalues_method_key: 'booking'
      },

      other_fees: {
        name: 'other_fees',
        input_type: 'string',
        choices: {
          # add 1.5% to top
          :inputFieldValue => { params: { val: 'inputFieldValue', top: '88.8%', left: '29.8%', width: '20%', class_name: 'document-rectangle', input_type: 'string' } },
        },
        className: 'form-control-document',
        component: 'DocumentChoices',
        translation_key: 'otherFees',
        category: 'agreement',
        initialvalues_method_key: 'booking'
        # required: true
      },
  # },
  # 3: {
    # NOTE!!!!! Owner is referred to in documents as landlord
    # to make consistent with other parts of code (user (tenant) vs owner),
    # flat_owner is the title holder of the flat and corresponds to the owner columns in the flat model
    owner_address: {
      name: 'owner_address',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '9.4%', left: '37.8%', width: '51.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_record: 'flat_languages',
      translation_column: 'owner_address',
      translation_field: 'owner_address_translation',
      translation_key: 'landlordAddress',
      category: 'landlord',
      initialvalues_method_key: 'owner',
      # actual_record_key: 'owner_address'
    },

    owner_address_translation: {
      name: 'owner_address_translation',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '11.2%', left: '37.8%', width: '51.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'landlordAddress',
      category: 'landlord',
      translation_object: true,
      initialvalues_method_key: 'owner',
      # actual_record_key: 'owner_address'
    },

    owner_company: {
      name: 'owner_company',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '13.3%', left: '37.8%', width: '24.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_record: 'flat_languages',
      translation_column: 'owner_name',
      translation_field: 'owner_company_translation',
      translation_key: 'landordCompanyName',
      category: 'landlord',
      initialvalues_method_key: 'owner',
      # actual_record_key: 'owner_name'
    },

    owner_company_translation: {
      name: 'owner_company_translation',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '15.1%', left: '37.8%', width: '24.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'landordCompanyName',
      category: 'landlord',
      translation_object: true,
      initialvalues_method_key: 'owner',
      # actual_record_key: 'owner_name'
    },

    owner_name: {
      name: 'owner_name',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '17.1%', left: '40.5%', width: '25%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_record: 'flat_languages',
      translation_column: 'owner_name',
      translation_field: 'owner_name_translation',
      translation_key: 'landlordName',
      category: 'landlord',
      initialvalues_method_key: 'owner',
      # actual_record_key: 'owner_contact_name'
    },

    owner_name_translation: {
      name: 'owner_name_translation',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '19.2%', left: '40.5%', width: '30%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'landlordName',
      category: 'landlord',
      translation_object: true,
      initialvalues_method_key: 'owner',
      # actual_record_key: 'owner_contact_name'
    },

    owner_phone: {
      name: 'owner_phone',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '13.2%', left: '70%', width: '19.4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'landlordPhone',
      category: 'landlord',
      initialvalues_method_key: 'owner'
    },

    management_address: {
      name: 'management_address',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '21.1%', left: '39.5%', width: '50%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'management_address_translation',
      translation_key: 'managementAddress',
      category: 'management',
      initialvalues_method_key: 'management'
    },

    management_address_translation: {
      name: 'management_address_translation',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '23%', left: '39.5%', width: '50%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'managementAddress',
      category: 'management',
      translation_object: true,
      initialvalues_method_key: 'management'
    },

    management_company: {
      name: 'management_company',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '24.85%', left: '37%', width: '25%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'management_name_translation',
      translation_key: 'managementCompany',
      category: 'management',
      initialvalues_method_key: 'management'
    },

    management_company_translation: {
      name: 'management_company_translation',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '26.67%', left: '37%', width: '25%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'managementCompany',
      category: 'management',
      translation_object: true,
      initialvalues_method_key: 'management'
    },

    management_name: {
      name: 'management_name',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '28.5%', left: '40.5%', width: '25%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'management_name_translation',
      translation_key: 'managementName',
      category: 'management',
      initialvalues_method_key: 'management'
    },

    management_name_translation: {
      name: 'management_name_translation',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '30.7%', left: '40.5%', width: '30%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'managementName',
      category: 'management',
      translation_object: true,
      initialvalues_method_key: 'management'
    },

    management_phone: {
      name: 'management_phone',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '24.9%', left: '70%', width: '19.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'managementPhone',
      category: 'management',
      initialvalues_method_key: 'management'
    },

    management_registration_number_front: {
      name: 'management_registration_number_front',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '32.6%', left: '67.7%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'registrationNoFirst',
      category: 'management',
      initialvalues_method_key: 'management'
    },
    # management_registration_type: {
    #   name: 'management_registration_type',
    #   input_type: 'string',
    #   choices: {
    #     # add 1.5% to top
    #     :inputFieldValue => { params: { val: 'inputFieldValue', top: '32.6%', left: '67.7%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
    #   },
    #   className: 'form-control-document',
    #   component: 'DocumentChoices'
    # },

    management_registration_number: {
      name: 'management_registration_number',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '32.6%', left: '75.2%', width: '11.2%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'registration',
      category: 'management',
      initialvalues_method_key: 'management'
    },

    # chnaged from building_owner_name address and phone;
    # IMPORTANT: flat_owner is the owner of the flat, not the landlord who can be other than the actual owner
    flat_owner_address: {
      name: 'flat_owner_address',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '39.1%', left: '37.5%', width: '51.8%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_record: 'flat_languages',
      translation_column: 'owner_address',
      translation_field: 'flat_owner_address_translation',
      translation_key: 'ownerAddress',
      category: 'flat_owner',
      initialvalues_method_key: 'flat',
      actual_record_key: 'owner_address'
    },

    flat_owner_address_translation: {
      name: 'flat_owner_address_translation',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '40.8%', left: '37.5%', width: '51.8%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'ownerAddress',
      category: 'owner',
      translation_object: true,
      initialvalues_method_key: 'flat',
      actual_record_key: 'owner_address'
    },

    flat_owner_company: {
      name: 'flat_owner_company',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '42.7%', left: '37%', width: '25%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_record: 'flat_languages',
      translation_column: 'owner_name',
      translation_field: 'flat_owner_company_translation',
      translation_key: 'ownerCompany',
      category: 'owner',
      initialvalues_method_key: 'flat',
      actual_record_key: 'owner_name'
    },

    flat_owner_company_translation: {
      name: 'flat_owner_company_translation',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '44.7%', left: '37%', width: '25%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'ownerCompany',
      category: 'owner',
      translation_object: true,
      initialvalues_method_key: 'flat',
      actual_record_key: 'owner_name'
    },

    flat_owner_name: {
      name: 'flat_owner_name',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '46.6%', left: '40.5%', width: '25%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_record: 'flat_languages',
      translation_column: 'owner_contact_name',
      translation_field: 'flat_owner_name_translation',
      translation_key: 'ownertName',
      category: 'owner',
      initialvalues_method_key: 'flat',
      actual_record_key: 'owner_contact_name'
    },

    flat_owner_name_translation: {
      name: 'flat_owner_name_translation',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '48.3%', left: '40.5%', width: '25%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'ownertName',
      category: 'owner',
      translation_object: true,
      initialvalues_method_key: 'flat',
      actual_record_key: 'owner_contact_name'
    },

    flat_owner_phone: {
      name: 'flat_owner_phone',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '42.8%', left: '69.7%', width: '19.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      record_column: 'owner_phone',
      translation_key: 'ownerPhone',
      category: 'owner',
      initialvalues_method_key: 'flat',
      actual_record_key: 'owner_phone',
      language_independent: true
    },

    tenant_name: {
      name: 'tenant_name',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '56.6%', left: '29%', width: '15.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'nameTenant',
      category: 'tenant',
      initialvalues_method_key: 'tenant'
    },

    tenant_age: {
      name: 'tenant_age',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '59.3%', left: '32%', width: '5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'ageTenant',
      category: 'tenant',
      initialvalues_method_key: 'tenant'
    },

    tenant_phone: {
      name: 'tenant_phone',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '64.6%', left: '23.3%', width: '15.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'phoneTenant',
      category: 'tenant',
      initialvalues_method_key: 'tenant'
    },

    co_tenant_name: {
      name: 'co_tenant_name',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '55.6%', left: '53%', width: '23%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'nameCoTenant',
      category: 'tenant',
      initialvalues_method_key: 'tenant'
    },

    co_tenant_age: {
      name: 'co_tenant_age',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '55.6%', left: '82.6%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'ageCoTenant',
      category: 'tenant',
      initialvalues_method_key: 'tenant'
    },

    co_tenant_name_1: {
      name: 'co_tenant_name_1',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '58.6%', left: '53%', width: '23%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'nameCoTenant1',
      category: 'tenant',
      initialvalues_method_key: 'tenant'
      # required: true
    },

    co_tenant_age_1: {
      name: 'co_tenant_age_1',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '58.6%', left: '82.6%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'ageCoTenant1',
      category: 'tenant',
      initialvalues_method_key: 'tenant'
      # required: true
    },

    co_tenant_name_2: {
      name: 'co_tenant_name_2',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '61.6%', left: '53%', width: '23%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'nameCoTenant2',
      category: 'tenant',
      initialvalues_method_key: 'tenant'
    },

    co_tenant_age_2: {
      name: 'co_tenant_age_2',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '61.6%', left: '82.6%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'ageCoTenant2',
      category: 'tenant',
      initialvalues_method_key: 'tenant'
    },

    co_tenants: {
      name: 'co_tenants',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '64.7%', left: '83%', width: '4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'cotenant',
      category: 'tenant',
      initialvalues_method_key: 'tenant'
    },

    emergency_contact_address: {
      name: 'emergency_contact_address',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '67.6%', left: '38.5%', width: '51%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'address',
      category: 'tenant',
      group: 'emergencyContact',
      initialvalues_method_key: 'tenant'
    },

  emergency_contact_name: {
      name: 'emergency_contact_name',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '71.95%', left: '31.1%', width: '14.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'name',
      category: 'tenant',
      group: 'emergencyContact',
      initialvalues_method_key: 'tenant'
    },

    emergency_contact_phone: {
      name: 'emergency_contact_phone',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '71.95%', left: '49.8%', width: '17%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'phone',
      category: 'tenant',
      group: 'emergencyContact',
      initialvalues_method_key: 'tenant'
    },

    emergency_contact_relationship: {
      name: 'emergency_contact_relationship',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '71.95%', left: '70%', width: '19%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'relationship',
      category: 'tenant',
      group: 'emergencyContact',
      initialvalues_method_key: 'tenant'
    },

    guarantor_address: {
      name: 'guarantor_address',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '77.3%', left: '39.1%', width: '50.4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'guarantor_address_translation',
      translation_key: 'addressGuarantee',
      category: 'tenant',
      group: 'guarantor',
      initialvalues_method_key: 'guarantor'
    },

    guarantor_address_translation: {
      name: 'guarantor_address_translation',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '79.4%', left: '39.1%', width: '50.4%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'addressGuarantee',
      category: 'tenant',
      translation_object: true,
      group: 'guarantor',
      initialvalues_method_key: 'guarantor'
    },

    guarantor_name: {
      name: 'guarantor_name',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '82%', left: '40.2%', width: '21%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'guarantor_name_translation',
      translation_key: 'nameGuarantee',
      category: 'tenant',
      group: 'guarantor',
      initialvalues_method_key: 'guarantor'
    },

    guarantor_name_translation: {
      name: 'guarantor_name_translation',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '84.5%', left: '40.2%', width: '21%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'nameGuarantee',
      category: 'tenant',
      translation_object: true,
      group: 'guarantor',
      initialvalues_method_key: 'guarantor'
    },

    guarantor_phone: {
      name: 'guarantor_phone',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '81.9%', left: '69.7%', width: '20%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'phoneGuarantee',
      category: 'tenant',
      group: 'guarantor',
      initialvalues_method_key: 'guarantor'
    },

    guarantor_type: {
      name: 'guarantor_type',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '87.4%', left: '66.6%', width: '2.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'ministersRegistrationGuarantee',
      category: 'tenant',
      group: 'guarantor',
      initialvalues_method_key: 'guarantor'
    },

    guarantor_registration: {
      name: 'guarantor_registration',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '87.4%', left: '72.5%', width: '11.2%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'registrationGuarantee',
      category: 'tenant',
      group: 'guarantor',
      initialvalues_method_key: 'guarantor'
    },
  #
  #
  # },
  # 12: {
    contract_year: {
      name: 'contract_year',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '19.1%', left: '22.5%', width: '5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'year',
      category: 'agreement',
      group: 'agreementDate',
      initialvalues_method_key: 'agreement'
    },

    contract_month: {
      name: 'contract_month',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '19.1%', left: '34.2%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'month',
      category: 'agreement',
      group: 'agreementDate',
      initialvalues_method_key: 'booking'
    },

    contract_day: {
      name: 'contract_day',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '19.1%', left: '43.5%', width: '3%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'day',
      category: 'agreement',
      group: 'agreementDate',
      initialvalues_method_key: 'booking'
    },

    owner_address_1: {
      name: 'owner_address_1',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '23.1%', left: '32.8%', width: '51.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'owner_address_translation',
    },

    owner_address_translation_1: {
      name: 'owner_address_translation_1',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '25.2%', left: '32.8%', width: '51.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
    },

    owner_name_1: {
      name: 'owner_name_1',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '27.5%', left: '32.8%', width: '30%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'owner_name_translation',
    },

    owner_name_translation_1: {
      name: 'owner_name_translation_1',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '29.8%', left: '32.8%', width: '30%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
    },

    owner_phone_1: {
      name: 'owner_phone_1',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '32.4%', left: '34.8%', width: '21%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
    },

    tenant_address: {
      name: 'tenant_address',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '36.6%', left: '32.8%', width: '51.5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'addressTenant',
      category: 'tenant',
      initialvalues_method_key: 'tenant'
      # translation_field: 'owner_address_translation'
    },

    tenant_name_1: {
      name: 'tenant_name_1',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '41.3%', left: '32.8%', width: '30%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # translation_field: 'owner_name_translation'
    },

    tenant_phone_1: {
      name: 'tenant_phone_1',
      input_type: 'string',
      choices: {
        # add 1.5% to top
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '45.6%', left: '34.8%', width: '21%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      # translation_key: 'floorSpace',
      # category: 'building'
    },

    broker_registration_jurisdiction: {
      name: 'broker_registration_jurisdiction',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '54.2%', left: '37%', width: '9%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'brokerRegistrationJurisdiction',
      category: 'broker',
      initialvalues_method_key: 'management'
    },

    broker_registration_jurisdiction_translation: {
      name: 'broker_registration_jurisdiction_translation',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '56.2%', left: '36%', width: '10%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'brokerRegistrationJurisdiction',
      category: 'broker',
      translation_object: true,
      initialvalues_method_key: 'management'
    },

    broker_registration_grantor: {
      name: 'broker_registration_grantor',
      input_type: 'string',
      choices: {
        :governor => { params: { val: 'governor', top: '54.2%', left: '47.2%', width: '5%', class_name: 'document-rectangle', input_type: 'button' } },
        :minister => { params: { val: 'minister', top: '54.2%', left: '52.9%', width: '12%', class_name: 'document-rectangle', input_type: 'button' } },
        # 2 => { params: { val: 'K', top: '39.6%', left: '73.4%', width: '3%', class_name: 'document-rectangle', input_type: 'button' } },
        # 3 => { params: { val: 'One Room', top: '39.6%', left: '76.5%', width: '10%', class_name: 'document-rectangle', input_type: 'button' } }
      },
      box: { style: { display: 'flex', flexDirection: 'column', justifyContent: 'center' } },
      className: 'form-control-document',
      height: '23px',
      component: 'DocumentChoices',
      translation_key: 'brokerRegistrationGrantor',
      category: 'broker',
      initialvalues_method_key: 'management'
      # borderColor: 'blue'
    },

    broker_registration_front_number: {
      name: 'broker_registration_front_number',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '54.2%', left: '67%', width: '5%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'licenseNoFirst',
      category: 'broker',
      group: 'brokerLicenseNumber',
      initialvalues_method_key: 'management'
    },

    broker_registration_number: {
      name: 'broker_registration_number',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '54.2%', left: '78.3%', width: '12%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'license',
      category: 'broker',
      group: 'brokerLicenseNumber',
      initialvalues_method_key: 'management'
    },

    broker_address_hq: {
      name: 'broker_address_hq',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '62.6%', left: '38.8%', width: '55%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'broker_address_hq_translation',
      translation_key: 'brokerAddress',
      category: 'broker',
      initialvalues_method_key: 'management'
    },

    broker_address_hq_translation: {
      name: 'broker_address_hq_translation',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '64.3%', left: '38.8%', width: '55%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'brokerAddress',
      category: 'broker',
      translation_object: true,
      initialvalues_method_key: 'management'
    },

    broker_company_name: {
      name: 'broker_company_name',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '66.6%', left: '38.8%', width: '55%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'broker_company_name_translation',
      translation_key: 'brokerCompanyName',
      category: 'broker',
      initialvalues_method_key: 'management'
    },

    broker_company_name_translation: {
      name: 'broker_company_name_translation',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '68.7%', left: '38.8%', width: '55%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'brokerCompanyName',
      category: 'broker',
      translation_object: true,
      initialvalues_method_key: 'management'
    },

    broker_representative_name: {
      name: 'broker_representative_name',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '70.9%', left: '38.8%', width: '25%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'broker_representative_name_translation',
      translation_key: 'brokerRepresentative',
      category: 'broker',
      initialvalues_method_key: 'management'
    },

    broker_representative_name_translation: {
      name: 'broker_representative_name_translation',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '72.9%', left: '38.8%', width: '25%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'brokerRepresentative',
      category: 'broker',
      translation_object: true,
      initialvalues_method_key: 'management'
    },

    broker_staff_registration_jurisdiction: {
      name: 'broker_staff_registration_jurisdiction',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '75.4%', left: '58.5%', width: '10%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'brokerStaffRegJurisdiction',
      category: 'broker',
      group: 'brokerStaff',
      initialvalues_method_key: 'management'
    },

    broker_staff_registration_jurisdiction_translation: {
      name: 'broker_staff_registration_jurisdiction_translation',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '77.4%', left: '58%', width: '11%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'brokerStaffRegJurisdiction',
      category: 'broker',
      translation_object: true,
      group: 'brokerStaff',
      initialvalues_method_key: 'management'
    },

    broker_staff_registration: {
      name: 'broker_staff_registration',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '75.4%', left: '78.5%', width: '12%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'licenseNumber',
      category: 'broker',
      group: 'brokerStaff',
      initialvalues_method_key: 'management'
    },

    broker_staff_name: {
      name: 'broker_staff_name',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '79.8%', left: '52%', width: '32%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'broker_staff_name_translation',
      translation_key: 'nameBroker',
      category: 'broker',
      group: 'brokerStaff',
      initialvalues_method_key: 'management'
    },

    broker_staff_name_translation: {
      name: 'broker_staff_name_translation',
      input_type: 'string',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '82.2%', left: '52%', width: '32%', class_name: 'document-rectangle', input_type: 'string' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'nameBroker',
      category: 'broker',
      translation_object: true,
      group: 'brokerStaff',
      initialvalues_method_key: 'management'
    },
    # !!!!!!! amenities_list and translation just for development take out later
    amenities_list: {
      name: 'amenities_list',
      input_type: 'text',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '0%', left: '0%', width: '20%', class_name: 'document-rectangle', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_field: 'amenities_list_translation',
      translation_key: 'amenities',
      # category: 'broker',
      # group: 'brokerStaff'
      # agreement_id just to mimic a template element
      agreement_id: 5,
      list_parameters: "fixed_term_rental_contract_bilingual,base,amenities,true,bath_tub,shower,ac,auto_lock"
    },

    # !!!!!!! amenities_list and translation just for development take out later
    amenities_list_translation: {
      name: 'amenities_list_translation',
      input_type: 'text',
      choices: {
        :inputFieldValue => { params: { val: 'inputFieldValue', top: '0%', left: '0%', width: '20%', class_name: 'document-rectangle', input_type: 'text' } },
      },
      className: 'form-control-document',
      component: 'DocumentChoices',
      translation_key: 'amenities',
      # category: 'broker',
      translation_object: true,
      # group: 'brokerStaff'
      # agreement_id just to mimic a template element
      agreement_id: 5,
      list_parameters: "fixed_term_rental_contract_bilingual,translation,amenities,true,bath_tub,shower,ac,auto_lock"
    },
  # }
      #
  }
    # object = important_points_explanation
  #   return object
  # end
end

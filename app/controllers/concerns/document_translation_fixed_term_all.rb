module DocumentTranslationFixedTermAll
  # CONTANT for fetch_translation and save and create agreement in booking
  # def fixed_term_rental_contract_translation
    # include FixedTermRentalContractTranslation
    OBJECT = {
      # 1 => {
      documentTitle: {
        translations: { en: 'Fixed Term Rental Contract', po: 'Contrato de Locação a Prazo Fixo', jp: '' },
        attributes: { top: '10.5%', left: '27.5%', font_size: '12', width: '45%', text_align: 'center', height: '1.5%', class_name: 'document-translation', font_weight: 'bold' }
      },

      heading: {
        translations: { en: 'Heading', po: 'Topo', jp: '' },
        attributes: { top: '12.8%', left: '17%', font_size: '10', class_name: 'document-translation', font_weight: 'bold' }
      },

      rentalInformation: {
        translations: { en: 'Rental Information', po: 'Informação de Aluguel', jp: '' },
        attributes: { top: '14.5%', left: '32.5%', font_size: '10', class_name: 'document-translation' }
      },

      buildingName: {
        translations: { en: 'Name', po: 'Nome', jp: 'ビル名' },
        examples: { en: 'The Building Name', p: 'O nome do Edifício'},
        attributes: { top: '18.8%', left: '22.5%', font_size: '10', class_name: 'document-translation' }
      },

      buildingAddress: {
        translations: { en: 'Address', po: 'Endereço', jp: '' },
        attributes: { top: '23.3%', left: '22%', font_size: '10', class_name: 'document-translation' }
      },

      buildingInformation: {
        translations: { en: 'Building Information', po: 'Informação de construção', jp: '' },
        attributes: { top: '34%', left: '16.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' }
      },

      buildingType: {
        translations: { en: 'Building Type', po: 'Tipo de construção', jp: '建物の種類' },
        attributes: { top: '33%', left: '20.5%', font_size: '10', width: '10%', class_name: 'document-translation' }
      },

      apartment: {
        translations: { en: 'Apartment', po: 'Apartamento', jp: '' },
        attributes: { top: '26.7%', left: '34%', font_size: '10', class_name: 'document-translation' }
      },

      townhouse: {
        translations: { en: 'Townhouse', po: 'Moradia', jp: '' },
        attributes: { top: '30.5%', left: '34%', font_size: '10', class_name: 'document-translation' }
      },

      singleFamily: {
        translations: { en: 'Single Family', po: 'Única família', jp: '' },
        attributes: { top: '34.4%', left: '34%', font_size: '10', class_name: 'document-translation' }
      },

      other: {
        translations: { en: 'Other', po: 'De outros', jp: '' },
        attributes: { top: '37.8%', left: '34%', font_size: '10', class_name: 'document-translation' }
      },

      construction: {
        translations: { en: 'Construction', po: 'Construção', jp: '' },
        attributes: { top: '30.4%', left: '46.2%', font_size: '10', text_align: 'center', width: '9%', height: '1.5%', class_name: 'document-translation' }
      },


      # floors: {
      #   translations: { en: 'Floors', po: 'Pavimentos', jp: '' },
      #   attributes: nil
      # },

      numberOfUnits: {
        translations: { en: 'No. of Units', po: 'Nº de Unidades', jp: '' },
        attributes: { top: '37.1%', left: '46.4%', font_size: '10', class_name: 'document-translation' }
      },

      wooden: {
        translations: { en: 'Wooden', po: 'De Madeira', jp: '' },
        attributes: { top: '26.5%', left: '58.4%', font_size: '10', class_name: 'document-translation' }
      },

      nonWood: {
        translations: { en: 'Non-wood', po: 'Não Madeira', jp: '' },
        attributes: { top: '29.3%', left: '58.4%', font_size: '10', class_name: 'document-translation' }
      },

      unit: {
        translations: { en: 'Unit', po: 'Unidade', jp: '' },
        attributes: { top: '37.1%', left: '56.4%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' }
      },

      stories: {
        translations: { en: 'Stories', po: 'Pavimentos', jp: '' },
        attributes: { top: '33.3%', left: '56.3%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' }
      },

      yearBuilt: {
        translations: { en: 'Year Built', po: 'Ano de Construção', jp: '' },
        attributes: { top: '26.5%', left: '76.9%', font_size: '10', class_name: 'document-translation' },
        examples: { en: '2000', po: '2000'}
      },

      majorRenovation: {
        translations: { en: 'Major Renovation', po: 'Renovação Principal', jp: '' },
        attributes: { top: '32.1%', left: '75.6%', font_size: '10', class_name: 'document-translation' },
        examples: { en: '2010', po: '2010'}
      },

      completed: {
        translations: { en: 'Completed', po: 'Concluído', jp: '' },
        attributes: { top: '36.5%', left: '77.4%', font_size: '10', class_name: 'document-translation' }
      },

      unitInformation: {
        translations: { en: 'Unit Information', po: 'Informação da Unidade', jp: '' },
        attributes: { top: '69.3%', left: '16.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' }
      },

      equipment: {
        translations: { en: 'Equipment', po: 'Equipamento', jp: '' },
        attributes: { top: '71%', left: '23.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' }
      },

      unitNumber: {
        translations: { en: 'Unit Number', po: 'Unidade Não.', jp: '' },
        attributes: { top: '41%', left: '20.1%', font_size: '10', class_name: 'document-translation' }
      },

      unitNo: {
        translations: { en: 'Unit No.', po: 'Unidade', jp: '' },
        attributes: { top: '41%', left: '29.5%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' }
      },

      layout: {
        translations: { en: 'Layout', po: 'Layout', jp: '' },
        attributes: { top: '41%', left: '48%', font_size: '10', class_name: 'document-translation' }
      },

      rooms: {
        translations: { en: 'Rooms', po: 'Quartos', jp: '' },
        attributes: { top: '41%', left: '48%', font_size: '10', class_name: 'document-translation' }
      },

      oneRoom: {
        translations: { en: 'One Room', po: 'Um quarto', jp: '' },
        attributes: { top: '41%', left: '77.1%', font_size: '10', class_name: 'document-translation' }
      },

      floorSpace: {
        translations: { en: 'Floor Space', po: 'Espaço no chão', jp: '' },
        attributes: { top: '44%', left: '20.1%', font_size: '10', class_name: 'document-translation' }
      },

      balcony: {
        translations: { en: 'In addition, balcony', po: 'Além disso, varanda', jp: '' },
        attributes: { top: '44%', left: '57.1%', font_size: '10', class_name: 'document-translation' }
      },

      toilet: {
        translations: { en: 'Toilet', po: 'Banheiro', jp: '' },
        attributes: { top: '47%', left: '31.1%', font_size: '10', class_name: 'document-translation' }
      },

      toiletAvailability: {
        translations: { en: 'Own (flush・non-flush) ・Shared (flush・sem flush)', po: 'Próprio (flush, sem flush) ・ Compartilhado (flush, non-flush)', jp: '' },
        attributes: { top: '47%', left: '39.6%', font_size: '10', width: '50%', text_align: 'right', height: '1.5%', class_name: 'document-translation' }
      },

      yesNoL: {
        translations: { en: 'Yes・No', po: 'Sim・Não', jp: '' },
        attributes: { top: '49%', left: '54.4%', font_size: '10', class_name: 'document-translation' }
      },

      yesNoR: {
        translations: { en: 'Yes・No', po: 'Sim・Não', jp: '' },
        attributes: { top: '49%', left: '83.6%', font_size: '10', class_name: 'document-translation' }
      },

      bathTub: {
        translations: { en: 'Bath Tub', po: 'Banheira', jp: '浴槽' },
        attributes: { top: '52%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      shower: {
        translations: { en: 'Shower', po: 'Chuveiro', jp: 'シャワー' },
        attributes: { top: '54.8%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      washBasin: {
        translations: { en: 'Wash Basin', po: 'Lavatório', jp: '洗面台' },
        attributes: { top: '57.6%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      washerArea: {
        translations: { en: 'Washer Area', po: 'Lavadora de área', jp: '洗濯機台' },
        attributes: { top: '60.4%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      waterHeater: {
        translations: { en: 'Water Heater', po: 'Aquecedor de água', jp: '給湯器' },
        attributes: { top: '63.2%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      kitchenStove: {
        translations: { en: 'Kitchen Stove', po: 'Fogão de cozinha', jp: 'キッチンストーブ' },
        attributes: { top: '66%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      parcelBox: {
        translations: { en: 'Parcel Box', po: 'Caixa de encomendas', jp: '宅配箱' },
        attributes: { top: '68.8%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      lock_key: {
        translations: { en: 'Key', po: 'Chave', jp: 'ドアロック' },
        attributes: { top: '71.5%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      ac: {
        translations: { en: 'A/C', po: 'A/C', jp: 'エアコン' },
        attributes: { top: '52%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      fixedLighting: {
        translations: { en: 'Fixed Lighting', po: 'Iluminação Fixa', jp: '照明' },
        attributes: { top: '54.8%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      autoLock: {
        translations: { en: 'Auto Lock', po: 'Bloqueio automático', jp: 'オートロック' },
        attributes: { top: '57.6%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      digitalTv: {
        translations: { en: 'Digital TV・CATV Ready', po: 'TV digital · CATV Ready', jp: 'デジタルテレビ対応' },
        attributes: { top: '60.4%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      internetReady: {
        translations: { en: 'Internet Ready', po: 'Pronto para Internet', jp: 'インターネット対応' },
        attributes: { top: '63.2%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      mailBox: {
        translations: { en: 'Mail Box', po: 'Caixa de correio', jp: '投函箱' },
        attributes: { top: '66%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      key: {
        translations: { en: 'Key No.', po: 'Key No.', jp: '鍵' },
        attributes: { top: '74.2%', left: '31.7%', font_size: '10', class_name: 'document-translation' }
      },

      sets: {
        translations: { en: 'Sets', po: 'Conjuntos', jp: '' },
        attributes: { top: '74.2%', left: '54.2%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' }
      },

      electricCapacity: {
        translations: { en: 'Electric Capacity', po: 'Capacidade Elétrica', jp: '' },
        attributes: { top: '77.4%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      gas: {
        translations: { en: 'Gas', po: 'Gás', jp: '' },
        attributes: { top: '81%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      water: {
        translations: { en: 'Water', po: 'Agua', jp: '水道' },
        attributes: { top: '85%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      sewage: {
        translations: { en: 'Sewage', po: 'Esgoto', jp: '' },
        attributes: { top: '89%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      amperes: {
        translations: { en: 'Amperes', po: 'Amperes', jp: '' },
        attributes: { top: '77%', left: '61.9%', font_size: '10', class_name: 'document-translation' }
      },

      gasAvailabiity: {
        translations: { en: 'Yes (City Gas・Propane Gas) ・ None', po: 'Sim (Gás Cidade ・ Gás Propano) ・ Nenhum', jp: '' },
        attributes: { top: '81%', left: '48.6%', font_size: '10', class_name: 'document-translation' }
      },

      waterAvailability: {
        translations: { en: 'Direct Link to Public Water・Water Tank ・ Well Water', po: 'Link direto para a água pública ・ Tanque de água ・ Água de poço', jp: '' },
        attributes: { top: '85%', left: '48.6%', font_size: '10', class_name: 'document-translation' }
      },

      sewageAvailability: {
        translations: { en: 'Yes (Public Sewage・Septic Tank) ・ None', po: 'Sim (Esgoto Público ・ Fossa Séptica) ・ Nenhum', jp: '' },
        attributes: { top: '89%', left: '48.6%', font_size: '10', class_name: 'document-translation' }
      },
  # },
  # 2 => {
    unitInformation1: {
      translations: { en: 'Unit Information (Continued)', po: '', jp: '' },
      attributes: { top: '23.5%', left: '16.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' }
    },

    facilities: {
      translations: { en: 'Facilities', po: '', jp: '' },
      attributes: { top: '19.5%', left: '24.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' }
    },

    includedNotIncluded: {
      translations: { en: 'Included・Not Included', po: '', jp: '' },
      attributes: { top: '7.7%', left: '45.6%', font_size: '10', class_name: 'document-translation' }
    },

    parking: {
      translations: { en: 'Parking', po: '', jp: '' },
      attributes: { top: '10.7%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    parkingIncluded: {
      translations: { en: 'Parking Included', po: '', jp: '' },
      attributes: nil
    },

    parkingSpaces: {
      translations: { en: 'Parking Spaces', po: '', jp: '' },
      attributes: nil
    },

    parkingNumber: {
      translations: { en: 'Parking Space No.', po: '', jp: '' },
      attributes: nil
    },

    bicycleParking: {
      translations: { en: 'Bicycle Parking', po: '', jp: '' },
      attributes: { top: '14.3%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    bicycleParkingIncluded: {
      translations: { en: 'Bicycle Parking Included', po: '', jp: '' },
      attributes: nil
    },

    bicycleParkingSpaces: {
      translations: { en: 'Bicycle Parking Spaces', po: '', jp: '' },
      attributes: nil
    },

    bicycleParkingNumber: {
      translations: { en: 'Bicycle Parking Space No.', po: '', jp: '' },
      attributes: nil
    },

    motocycleParking: {
      translations: { en: 'Motorcycle Parking', po: '', jp: '' },
      attributes: { top: '17.9%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    motocycleParkingIncluded: {
      translations: { en: 'Motorcycle Parking Included', po: '', jp: '' },
      attributes: nil
    },

    motocycleParkingSpaces: {
      translations: { en: 'Motorcycle Parking Included', po: '', jp: '' },
      attributes: nil
    },

    motocycleParkingNumber: {
      translations: { en: 'Motorcycle Parking Space No.', po: '', jp: '' },
      attributes: nil
    },

    storage: {
      translations: { en: 'Storage', po: '', jp: '' },
      attributes: { top: '21.2%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    storageIncluded: {
      translations: { en: 'Storage Included', po: '', jp: '' },
      attributes: nil
    },

    storageSpaces: {
      translations: { en: 'Storage Spaces', po: '', jp: '' },
      attributes: nil
    },

    storageNumber: {
      translations: { en: 'Storage Space No.', po: '', jp: '' },
      attributes: nil
    },

    ownYard: {
      translations: { en: 'Own Yard', po: '', jp: '' },
      attributes: { top: '24.8%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    otherFacility: {
      translations: { en: 'Other Facilities', po: '', jp: '' },
      attributes: nil
    },

    vehicles: {
      translations: { en: 'Vehicles', po: '', jp: '' },
      attributes: { top: '10.7%', left: '64.9%', font_size: '10', class_name: 'document-translation' }
    },

    spaceNo: {
      translations: { en: 'Space No.', po: '', jp: '' },
      attributes: { top: '10.7%', left: '71.5%', font_size: '10', class_name: 'document-translation' }
    },

    vehicles1: {
      translations: { en: 'Vehicles', po: '', jp: '' },
      attributes: { top: '14.3%', left: '64.9%', font_size: '10', class_name: 'document-translation' }
    },

    spaceNo1: {
      translations: { en: 'Space No.', po: '', jp: '' },
      attributes: { top: '14.3%', left: '71.5%', font_size: '10', class_name: 'document-translation' }
    },

    vehicles2: {
      translations: { en: 'Vehicles', po: '', jp: '' },
      attributes: { top: '17.9%', left: '64.9%', font_size: '10', class_name: 'document-translation' }
    },

    spaceNo2: {
      translations: { en: 'Space No.', po: '', jp: '' },
      attributes: { top: '17.9%', left: '71.5%', font_size: '10', class_name: 'document-translation' }
    },

    contractPeriod: {
      translations: { en: 'Contract Period', po: '', jp: '' },
      attributes: { top: '33%', left: '28%', font_size: '10', class_name: 'document-translation' }
    },

    start: {
      translations: { en: 'Start', po: '', jp: '' },
      attributes: { top: '35.9%', left: '14.2%', font_size: '10', class_name: 'document-translation' }
    },

    end: {
      translations: { en: 'End', po: '', jp: '' },
      attributes: { top: '38.7%', left: '14.2%', font_size: '10', class_name: 'document-translation' }
    },

    yearFrom: {
      translations: { en: 'Year', po: '', jp: '' },
      attributes: { top: '35.9%', left: '33%', font_size: '10', class_name: 'document-translation' }
    },

    monthFrom: {
      translations: { en: 'Month', po: '', jp: '' },
      attributes: { top: '35.9%', left: '44%', font_size: '10', class_name: 'document-translation' }
    },

    dayFrom: {
      translations: { en: 'Day', po: '', jp: '' },
      attributes: { top: '35.9%', left: '55.2%', font_size: '10', class_name: 'document-translation' }
    },

    yearTo: {
      translations: { en: 'Year', po: '', jp: '' },
      attributes: { top: '38.7%', left: '33%', font_size: '10', class_name: 'document-translation' }
    },

    monthTo: {
      translations: { en: 'Month', po: '', jp: '' },
      attributes: { top: '38.7%', left: '44%', font_size: '10', class_name: 'document-translation' }
    },

    dayTo: {
      translations: { en: 'Day', po: '', jp: '' },
      attributes: { top: '38.7%', left: '55.2%', font_size: '10', class_name: 'document-translation' }
    },

    yearsContract: {
      translations: { en: 'Year(s)', po: '', jp: '' },
      attributes: { top: '37.4%', left: '76%', font_size: '10', class_name: 'document-translation' }
    },

    monthsContract: {
      translations: { en: 'Month(s)', po: '', jp: '' },
      attributes: { top: '37.4%', left: '83.5%', font_size: '10', class_name: 'document-translation' }
    },

    contractNoticePeriod: {
      translations: { en: 'Notice of contract conclusion to be served from', po: '', jp: '' },
      attributes: { top: '41.7%', left: '14.2%', font_size: '10', class_name: 'document-translation' }
    },

    noticeYearFrom: {
      translations: { en: 'Year', po: '', jp: '' },
      attributes: { top: '41.7%', left: '48.3%', font_size: '10', class_name: 'document-translation' }
    },

    noticeMonthFrom: {
      translations: { en: 'Month', po: '', jp: '' },
      attributes: { top: '41.7%', left: '53.9%', font_size: '10', class_name: 'document-translation' }
    },

    noticeDayFrom: {
      translations: { en: 'Day', po: '', jp: '' },
      attributes: { top: '41.7%', left: '59.6%', font_size: '10', class_name: 'document-translation' }
    },

    noticeTo: {
      translations: { en: 'to', po: '', jp: '' },
      attributes: { top: '41.7%', left: '64.6%', font_size: '10', class_name: 'document-translation' }
    },

    noticeYearTo: {
      translations: { en: 'Year', po: '', jp: '' },
      attributes: { top: '41.7%', left: '70.5%', font_size: '10', class_name: 'document-translation' }
    },

    noticeMonthTo: {
      translations: { en: 'Month', po: '', jp: '' },
      attributes: { top: '41.7%', left: '76%', font_size: '10', class_name: 'document-translation' }
    },

    noticeDayTo: {
      translations: { en: 'Day', po: '', jp: '' },
      attributes: { top: '41.7%', left: '81.7%', font_size: '10', class_name: 'document-translation' }
    },

    rentAndOthers: {
      translations: { en: 'Rent & Others', po: '', jp: '' },
      attributes: { top: '45.2%', left: '25.7%', font_size: '10', class_name: 'document-translation' }
    },

    rentAndFees: {
      translations: { en: 'Rent・Fees', po: '', jp: '' },
      attributes: { top: '48.2%', left: '19.4%', font_size: '10', class_name: 'document-translation' }
    },

    dueDates: {
      translations: { en: 'Payment Due', po: '', jp: '' },
      attributes: { top: '48.2%', left: '41.6%', font_size: '10', class_name: 'document-translation' }
    },

    paymentMethod: {
      translations: { en: 'Payment Method', po: '', jp: '' },
      attributes: { top: '48.2%', left: '68.6%', font_size: '10', class_name: 'document-translation' }
    },

    rent: {
      translations: { en: 'Rent', po: '', jp: '' },
      attributes: { top: '51.4%', left: '15.5%', font_size: '10', class_name: 'document-translation' }
    },

    jp: {
      translations: { en: 'JPY', po: '', jp: '' },
      attributes: { top: '54%', left: '34.1%', font_size: '10', class_name: 'document-translation' }
    },

    rentDueDate: {
      translations: { en: 'Current Month Rent Due Date Each Month', po: '', jp: '' },
      attributes: { top: '53.4%', left: '38.1%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    rentDueDateEachMonth: {
      translations: { en: 'Rent Due Date Each Month', po: '', jp: '' },
      attributes: nil
    },

    fees: {
      translations: { en: 'Fees', po: '', jp: '' },
      attributes: { top: '57.9%', left: '14.1%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    jp1: {
      translations: { en: 'JPY', po: '', jp: '' },
      attributes: { top: '80%', left: '34.1%', font_size: '10', class_name: 'document-translation' }
    },

    feesDueDate: {
      translations: { en: 'Current Month Fees Due Date Each Month', po: '', jp: '' },
      attributes: { top: '70%', left: '38.1%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    feesDueDateEachMonth: {
      translations: { en: 'Fees Due Date Each Month', po: '', jp: '' },
      attributes: nil
    },

    accountOrInPerson: {
      translations: { en: 'Bank Wire or In Person', po: '', jp: '' },
      attributes: { top: '68.4%', left: '54%', font_size: '10', class_name: 'document-translation', width: '5%' }
    },

    bankName: {
      translations: { en: 'Bank Name', po: '', jp: '' },
      attributes: { top: '53.1%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    bankNameEnglish: {
      translations: { en: 'Bank Name English', po: '', jp: '' },
      attributes: nil
    },

    accountType: {
      translations: { en: 'Account Type: Ordinary・Current', po: '', jp: '' },
      attributes: { top: '58.3%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    accountNumber: {
      translations: { en: 'A/C No.', po: '', jp: '' },
      attributes: { top: '61.6%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    swift: {
      translations: { en: 'SWIFT', po: '', jp: '' },
      attributes: nil
    },

    accountName: {
      translations: { en: 'Account Name', po: '', jp: '' },
      attributes: { top: '70%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    accountNameAlphabet: {
      translations: { en: 'Account Name Alphabet', po: '', jp: '' },
      attributes: nil
    },

    transferFeePaidBy: {
      translations: { en: 'Transfer Fee Paid By: Landlor・Tenant', po: '', jp: '' },
      attributes: { top: '75%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    rentPaymentMethod: {
      translations: { en: 'Rent Payment Method', po: '', jp: '' },
      attributes: nil
    },

    paidInPerson: {
      translations: { en: 'Paid in Person', po: '', jp: '' },
      attributes: { top: '79.4%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    deposit: {
      translations: { en: 'Deposit', po: '', jp: '' },
      attributes: { top: '83.5%', left: '14%', font_size: '10', class_name: 'document-translation' }
    },

    rentDepositX: {
      translations: { en: 'Rent x No. of Months', po: '', jp: '' },
      attributes: { top: '83.5%', left: '22.3%', font_size: '10', class_name: 'document-translation' }
    },

    jpDeposit: {
      translations: { en: 'JPY', po: '', jp: '' },
      attributes: { top: '83.5%', left: '63.5%', font_size: '10', class_name: 'document-translation' }
    },

    facilityUsageFee: {
      translations: { en: 'Facility Usage Fee', po: '', jp: '' },
      attributes: { top: '86.5%', left: '14.8%', font_size: '10', class_name: 'document-translation' }
    },

    others: {
      translations: { en: 'Others', po: '', jp: '' },
      attributes: { top: '89.5%', left: '17%', font_size: '10', class_name: 'document-translation' }
    },

    otherFees: {
      translations: { en: 'Other Fees', po: '', jp: '' },
      attributes: nil
    },
  # },
  # 3 => {
    landlordAndManagemement: {
      translations: { en: 'Landlord & Management', po: '', jp: '' },
      attributes: { top: '7.7%', left: '37%', font_size: '10', class_name: 'document-translation' }
    },

    landlordCompanyAndRepresentative: {
      translations: { en: 'Landlord (Company Name ・ Representative)', po: '', jp: '' },
      attributes: { top: '16.5%', left: '15.5%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    landlordAddress: {
      translations: { en: 'Address', po: '', jp: '' },
      attributes: { top: '11.5%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    landordCompanyName: {
      translations: { en: 'Company', po: '', jp: '' },
      attributes: { top: '15.2%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    landlordName: {
      translations: { en: 'Representative', po: '', jp: '' },
      attributes: { top: '19.3%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    landlordPhone: {
      translations: { en: 'Phone', po: '', jp: '' },
      attributes: { top: '15%', left: '63.5%', font_size: '10', class_name: 'document-translation' }
    },

    managementCompanyAndRepresentative: {
      translations: { en: 'Management (Company Name ・ Representative)', po: '', jp: '' },
      attributes: { top: '29.5%', left: '15.5%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    managementAddress: {
      translations: { en: 'Address', po: '', jp: '' },
      attributes: { top: '23.2%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    managementCompany: {
      translations: { en: 'Company', po: '', jp: '' },
      attributes: { top: '26.8%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    managementName: {
      translations: { en: 'Representative', po: '', jp: '' },
      attributes: { top: '30.8%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    managementPhone: {
      translations: { en: 'Phone', po: '', jp: '' },
      attributes: { top: '26.6%', left: '63.5%', font_size: '10', class_name: 'document-translation' }
    },

    registration: {
      translations: { en: 'Registration No.', po: '', jp: '' },
      attributes: { top: '34%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    registrationNoFirst: {
      translations: { en: 'Registration No. First Part', po: '', jp: '' },
      attributes: nil
    },

    ministersRegistration: {
      translations: { en: 'Land & Transportation Minister', po: '', jp: '' },
      attributes: { top: '34%', left: '55.7%', font_size: '10', class_name: 'document-translation' }
    },

    ifOwnerLandordDifferent: {
      translations: { en: 'Fill-in below if owner is different from landlord', po: '', jp: '' },
      attributes: { top: '37.2%', left: '17.4%', font_size: '10', class_name: 'document-translation' }
    },

    propertyOwner: {
      translations: { en: 'Property Owner', po: '', jp: '' },
      attributes: { top: '42.5%', left: '15.9%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    ownerAddress: {
      translations: { en: 'Address', po: '', jp: '' },
      attributes: { top: '41.2%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    ownerCompany: {
      translations: { en: 'Company', po: '', jp: '' },
      attributes: { top: '44.9%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    ownertName: {
      translations: { en: 'Representative', po: '', jp: '' },
      attributes: { top: '48.6%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    ownerPhone: {
      translations: { en: 'Phone', po: '', jp: '' },
      attributes: { top: '44.5%', left: '63.5%', font_size: '10', class_name: 'document-translation' }
    },

    tenantAndCoTenants: {
      translations: { en: 'Tenant and Co-tenants', po: '', jp: '' },
      attributes: { top: '52.1%', left: '35.4%', font_size: '10', class_name: 'document-translation' }
    },

    nameHeading: {
      translations: { en: 'Name', po: '', jp: '' },
      attributes: { top: '62.5%', left: '15.4%', font_size: '10', class_name: 'document-translation' }
    },

    tenant: {
      translations: { en: 'Tenant', po: '', jp: '' },
      attributes: { top: '54%', left: '39.4%', font_size: '10', class_name: 'document-translation' }
    },

    cotenant: {
      translations: { en: 'Co-tenants', po: '', jp: '' },
      attributes: { top: '54%', left: '74.4%', font_size: '10', class_name: 'document-translation' }
    },

    nameTenant: {
      translations: { en: 'Name', po: '', jp: '' },
      attributes: { top: '57.8%', left: '24.4%', font_size: '10', class_name: 'document-translation' }
    },

    ageTenant: {
      translations: { en: 'Age', po: '', jp: '' },
      attributes: { top: '60.8%', left: '24.4%', font_size: '10', class_name: 'document-translation' }
    },

    yearsTenant: {
      translations: { en: 'Years', po: '', jp: '' },
      attributes: { top: '60.8%', left: '38%', font_size: '10', class_name: 'document-translation' }
    },

    phoneTenant: {
      translations: { en: 'Phone', po: '', jp: '' },
      attributes: { top: '63.6%', left: '24.4%', font_size: '10', class_name: 'document-translation' }
    },

    nameCoTenant: {
      translations: { en: 'Name', po: '', jp: '' },
      attributes: { top: '57%', left: '48.4%', font_size: '10', class_name: 'document-translation' }
    },

    nameCoTenant1: {
      translations: { en: 'Name', po: '', jp: '' },
      attributes: { top: '60.1%', left: '48.4%', font_size: '10', class_name: 'document-translation' }
    },

    nameCoTenant2: {
      translations: { en: 'Name', po: '', jp: '' },
      attributes: { top: '63.2%', left: '48.4%', font_size: '10', class_name: 'document-translation' }
    },

    ageCoTenant: {
      translations: { en: 'Age', po: '', jp: '' },
      attributes: { top: '57%', left: '77%', font_size: '10', class_name: 'document-translation' }
    },

    ageCoTenant1: {
      translations: { en: 'Age', po: '', jp: '' },
      attributes: { top: '60.1%', left: '77%', font_size: '10', class_name: 'document-translation' }
    },

    ageCoTenant2: {
      translations: { en: 'Age', po: '', jp: '' },
      attributes: { top: '63.2%', left: '77%', font_size: '10', class_name: 'document-translation' }
    },

    yearsCoTenant: {
      translations: { en: 'Years', po: '', jp: '' },
      attributes: { top: '57%', left: '86.5%', font_size: '10', class_name: 'document-translation' }
    },

    yearsCoTenant1: {
      translations: { en: 'Years', po: '', jp: '' },
      attributes: { top: '60.1%', left: '86.5%', font_size: '10', class_name: 'document-translation' }
    },

    yearsCoTenant2: {
      translations: { en: 'Years', po: '', jp: '' },
      attributes: { top: '63.2%', left: '86.5%', font_size: '10', class_name: 'document-translation' }
    },

    totalPersons: {
      translations: { en: 'Total No. Persons', po: '', jp: '' },
      attributes: { top: '66.1%', left: '78.5%', font_size: '10', class_name: 'document-translation' }
    },

    emergencyContact: {
      translations: { en: 'Emergency Contact', po: '', jp: '' },
      attributes: { top: '69.3%', left: '15.6%', font_size: '10', class_name: 'document-translation' }
    },

    address: {
      translations: { en: 'Address', po: '', jp: '' },
      attributes: { top: '69%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    name: {
      translations: { en: 'Name', po: '', jp: '名前' },
      attributes: { top: '70.4%', left: '35.8%', font_size: '10', class_name: 'document-translation' }
    },

    phone: {
      translations: { en: 'Phone', po: '', jp: '' },
      attributes: { top: '70.4%', left: '58.3%', font_size: '10', class_name: 'document-translation' }
    },

    relationship: {
      translations: { en: 'Relationship', po: '', jp: '' },
      attributes: { top: '70.4%', left: '82.2%', font_size: '10', class_name: 'document-translation' }
    },

    guaranteeByGuarantyCompanyHeading: {
      translations: { en: 'Guarantee by Guaranty Company', po: '', jp: '' },
      attributes: { top: '74.8%', left: '55.3%', font_size: '10', class_name: 'document-translation' }
    },

    guaranteeByGuarantyCompany: {
      translations: { en: 'Guarantee by Guaranty Company', po: '', jp: '' },
      attributes: { top: '84.4%', left: '14.2%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    addressGuarantee: {
      translations: { en: 'Address', po: '', jp: '' },
      attributes: { top: '79.5%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    nameGuarantee: {
      translations: { en: 'Name', po: '', jp: '' },
      attributes: { top: '84.5%', left: '31%', font_size: '10', class_name: 'document-translation' }
    },

    phoneGuarantee: {
      translations: { en: 'Phone', po: '', jp: '' },
      attributes: { top: '83.4%', left: '63.1%', font_size: '10', class_name: 'document-translation' }
    },

    registrationGuarantee: {
      translations: { en: 'Registration No.', po: '', jp: '' },
      attributes: { top: '88.9%', left: '31%', font_size: '10', class_name: 'document-translation' }
    },

    ministersRegistrationGuarantee: {
      translations: { en: 'Land & Transportation Minister', po: '', jp: '' },
      attributes: { top: '88.9%', left: '55.7%', font_size: '10', class_name: 'document-translation' }
    },
  # },
  # 12 => {
    signedAndSealed: {
      translations: { en: 'To be signed and sealed below', po: '', jp: '' },
      attributes: { top: '8.8%', left: '22.7%', font_size: '10', class_name: 'document-translation', font_weight: 'bold' }
    },

    inWitnessWhereOf: {
      translations: { en: 'IN WITNESS WHEREOF, the following Landlord and the Tenant have signed and affixed their seals to the Contract in duplicate, each party retaining one sealed copy.', po: '', jp: '' },
      attributes: { top: '15.8%', left: '16.3%', font_size: '10', class_name: 'document-translation', width: '76.5%' }
    },

    year: {
      translations: { en: 'Year', po: '', jp: '' },
      attributes: { top: '20.8%', left: '27.7%', font_size: '10', class_name: 'document-translation' }
    },

    month: {
      translations: { en: 'Month', po: '', jp: '' },
      attributes: { top: '20.8%', left: '37.3%', font_size: '10', class_name: 'document-translation' }
    },

    day: {
      translations: { en: 'Day', po: '', jp: '' },
      attributes: { top: '20.8%', left: '47.3%', font_size: '10', class_name: 'document-translation' }
    },

    landlord: {
      translations: { en: 'Landlord', po: '', jp: '' },
      attributes: { top: '25%', left: '14.5%', font_size: '10', class_name: 'document-translation' }
    },

    addressLandord: {
      translations: { en: 'Address', po: '', jp: '' },
      attributes: { top: '25.5%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    nameLandlord: {
      translations: { en: 'Name', po: '', jp: '' },
      attributes: { top: '30%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    phoneLandlord: {
      translations: { en: 'Phone', po: '', jp: '' },
      attributes: { top: '34%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    sealLandlord: {
      translations: { en: 'Seal', po: '', jp: '' },
      attributes: { top: '31.2%', left: '82%', font_size: '10', class_name: 'document-translation' }
    },

    tenant1: {
      translations: { en: 'Tenant', po: '', jp: '' },
      attributes: { top: '38.5%', left: '14.5%', font_size: '10', class_name: 'document-translation' }
    },

    addressTenant: {
      translations: { en: 'Address', po: '', jp: '' },
      attributes: { top: '38.5%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    nameTenant1: {
      translations: { en: 'Name', po: '', jp: '' },
      attributes: { top: '43%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    phoneTenant1: {
      translations: { en: 'Phone', po: '', jp: '' },
      attributes: { top: '47.5%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    sealTenant: {
      translations: { en: 'Seal', po: '', jp: '' },
      attributes: { top: '45%', left: '82%', font_size: '10', class_name: 'document-translation' }
    },

    intermediary: {
      translations: { en: 'Intermediary', po: '', jp: '' },
      attributes: { top: '56%', left: '14.5%', font_size: '10', class_name: 'document-translation' }
    },

    broker: {
      translations: { en: 'Broker', po: '', jp: '' },
      attributes: { top: '60.5%', left: '14.5%', font_size: '10', class_name: 'document-translation' }
    },

    brokerRegistrationJurisdiction: {
      translations: { en: 'Broker Registration Jurisdiction', po: '', jp: '' },
      attributes: nil
    },

    brokerRegistrationGrantor: {
      translations: { en: 'Broker Registration Grantor', po: '', jp: '' },
      attributes: nil
    },

    agent: {
      translations: { en: 'Agent', po: '', jp: '' },
      attributes: { top: '64%', left: '14.5%', font_size: '10', class_name: 'document-translation' }
    },

    license: {
      translations: { en: 'License No.', po: '', jp: '' },
      attributes: { top: '56%', left: '27%', font_size: '10', class_name: 'document-translation' }
    },

    licenseNoFirst: {
      translations: { en: 'License No. (first No.)', po: '', jp: '' },
      attributes: nil
    },

    governor: {
      translations: { en: 'Governor', po: '', jp: '' },
      attributes: { top: '56%', left: '47%', font_size: '10', class_name: 'document-translation' }
    },

    minister: {
      translations: { en: 'Minister', po: '', jp: '' },
      attributes: { top: '56%', left: '55%', font_size: '10', class_name: 'document-translation' }
    },

    brokerAddress: {
      translations: { en: 'Address', po: '', jp: '' },
      attributes: { top: '64.5%', left: '27%', font_size: '10', class_name: 'document-translation' }
    },

    brokerCompanyName: {
      translations: { en: 'Company Name', po: '', jp: '' },
      attributes: { top: '69%', left: '27%', font_size: '10', class_name: 'document-translation' }
    },

    brokerRepresentative: {
      translations: { en: 'Representative', po: '', jp: '' },
      attributes: { top: '73.3%', left: '27%', font_size: '10', class_name: 'document-translation' }
    },

    sealBrokerCompany: {
      translations: { en: 'Seal', po: '', jp: '' },
      attributes: { top: '73.3%', left: '65.5%', font_size: '10', class_name: 'document-translation' }
    },

    registeredBroker: {
      translations: { en: 'Registered Real Estate Broker', po: '', jp: '' },
      attributes: { top: '77.3%', left: '27%', font_size: '10', class_name: 'document-translation' }
    },

    licenseNumber: {
      translations: { en: 'License No.', po: '', jp: '' },
      attributes: { top: '77.3%', left: '48.9%', font_size: '10', class_name: 'document-translation' }
    },

    brokerStaffRegJurisdiction: {
      translations: { en: 'License No.', po: '', jp: '' },
      attributes: nil
    },

    governorBroker: {
      translations: { en: 'Governor', po: '', jp: '' },
      attributes: { top: '77.3%', left: '71.2%', font_size: '10', class_name: 'document-translation' }
    },

    nameBroker: {
      translations: { en: 'Name', po: '', jp: '' },
      attributes: { top: '82.4%', left: '48.9%', font_size: '10', class_name: 'document-translation' }
    },

    sealBroker: {
      translations: { en: 'Seal', po: '', jp: '' },
      attributes: { top: '82.4%', left: '87%', font_size: '10', class_name: 'document-translation' }
    },
  # }
}
    # object = fixed_term_rental
  #   return object
  # end
end

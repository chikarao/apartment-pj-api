module DocumentTranslationFixedTerm

  def fixed_term_rental_contract_translation
    # include FixedTermRentalContractTranslation
    object = {
      1 => {
      documentTitle: {
        translations: { en: 'Fixed Term Rental Contract', po: 'Contrato de Locação a Prazo Fixo', jp: '' },
        attributes: { top: '10.5%', left: '27.5%', font_size: '12', width: '45%', text_align: 'center', height: '1.5%', class_name: 'document-translation', font_weight: 'bold' }
      },

      heading: {
        translations: { en: 'Heading', po: 'Topo', jp: '' },
        attributes: { top: '12.8%', left: '17%', font_size: '10', class_name: 'document-translation', font_weight: 'bold' }
      },

      rentalInformation: {
        translations: { en: 'Rental Information', po: 'Informação de Aluguel', jpy: '' },
        attributes: { top: '14.5%', left: '32.5%', font_size: '10', class_name: 'document-translation' }
      },

      buildingName: {
        translations: { en: 'Name', po: 'Nome', jpy: '' },
        attributes: { top: '18.8%', left: '22.5%', font_size: '10', class_name: 'document-translation' }
      },

      buildingAddress: {
        translations: { en: 'Address', po: 'Endereço', jpy: '' },
        attributes: { top: '23.3%', left: '22%', font_size: '10', class_name: 'document-translation' }
      },

      buildingInformation: {
        translations: { en: 'Building Information', po: 'Informação de construção', jpy: '' },
        attributes: { top: '34%', left: '16.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' }
      },

      buildingType: {
        translations: { en: 'Building Type', po: 'Tipo de construção', jpy: '' },
        attributes: { top: '33%', left: '20.5%', font_size: '10', width: '10%', class_name: 'document-translation' }
      },

      apartment: {
        translations: { en: 'Apartment', po: 'Apartamento', jpy: '' },
        attributes: { top: '26.7%', left: '34%', font_size: '10', class_name: 'document-translation' }
      },

      townhouse: {
        translations: { en: 'Townhouse', po: 'Moradia', jpy: '' },
        attributes: { top: '30.5%', left: '34%', font_size: '10', class_name: 'document-translation' }
      },

      singleFamily: {
        translations: { en: 'Single Family', po: 'Única família', jpy: '' },
        attributes: { top: '34.4%', left: '34%', font_size: '10', class_name: 'document-translation' }
      },

      other: {
        translations: { en: 'Other', po: 'De outros', jpy: '' },
        attributes: { top: '37.8%', left: '34%', font_size: '10', class_name: 'document-translation' }
      },

      construction: {
        translations: { en: 'Construction', po: 'Construção', jpy: '' },
        attributes: { top: '30.4%', left: '46.2%', font_size: '10', text_align: 'center', width: '9%', height: '1.5%', class_name: 'document-translation' }
      },

      numberOfUnits: {
        translations: { en: 'No. of Units', po: 'Nº de Unidades', jpy: '' },
        attributes: { top: '37.1%', left: '46.4%', font_size: '10', class_name: 'document-translation' }
      },

      wooden: {
        translations: { en: 'Wooden', po: 'De Madeira', jpy: '' },
        attributes: { top: '26.5%', left: '58.4%', font_size: '10', class_name: 'document-translation' }
      },

      nonWood: {
        translations: { en: 'Non-wood', po: 'Não Madeira', jpy: '' },
        attributes: { top: '29.3%', left: '58.4%', font_size: '10', class_name: 'document-translation' }
      },

      unit: {
        translations: { en: 'Unit', po: 'Unidade', jpy: '' },
        attributes: { top: '37.1%', left: '56.4%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' }
      },

      stories: {
        translations: { en: 'Stories', po: 'Pavimentos', jpy: '' },
        attributes: { top: '33.3%', left: '56.3%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' }
      },

      yearBuilt: {
        translations: { en: 'Year Built', po: 'Ano de Construção', jpy: '' },
        attributes: { top: '26.5%', left: '76.9%', font_size: '10', class_name: 'document-translation' }
      },

      majorRenovation: {
        translations: { en: 'Major Renovation', po: 'Renovação Principal', jpy: '' },
        attributes: { top: '32.1%', left: '75.6%', font_size: '10', class_name: 'document-translation' }
      },

      completed: {
        translations: { en: 'Completed', po: 'Concluído', jpy: '' },
        attributes: { top: '36.5%', left: '77.4%', font_size: '10', class_name: 'document-translation' }
      },

      unitInformation: {
        translations: { en: 'Unit Information', po: 'Informação da Unidade', jpy: '' },
        attributes: { top: '69.3%', left: '16.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' }
      },

      equipment: {
        translations: { en: 'Equipment', po: 'Equipamento', jpy: '' },
        attributes: { top: '71%', left: '23.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' }
      },

      unitNumber: {
        translations: { en: 'Unit Number', po: 'Unidade Não.', jpy: '' },
        attributes: { top: '41%', left: '20.1%', font_size: '10', class_name: 'document-translation' }
      },

      unitNo: {
        translations: { en: 'Unit No.', po: 'Unidade', jpy: '' },
        attributes: { top: '41%', left: '29.5%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' }
      },
      layout: {
        translations: { en: 'Layout', po: 'Layout', jpy: '' },
        attributes: { top: '41%', left: '48%', font_size: '10', class_name: 'document-translation' }
      },

      oneRoom: {
        translations: { en: 'One Room', po: 'Um quarto', jpy: '' },
        attributes: { top: '41%', left: '77.1%', font_size: '10', class_name: 'document-translation' }
      },

      floorSpace: {
        translations: { en: 'Floor Space', po: 'Espaço no chão', jpy: '' },
        attributes: { top: '44%', left: '20.1%', font_size: '10', class_name: 'document-translation' }
      },

      balcony: {
        translations: { en: 'In addition, balcony', po: 'Além disso, varanda', jpy: '' },
        attributes: { top: '44%', left: '57.1%', font_size: '10', class_name: 'document-translation' }
      },

      toilet: {
        translations: { en: 'Toilet', po: 'Banheiro', jpy: '' },
        attributes: { top: '47%', left: '31.1%', font_size: '10', class_name: 'document-translation' }
      },

      toiletAvailability: {
        translations: { en: 'Own (flush・non-flush) ・Shared (flush・sem flush)', po: 'Próprio (flush, sem flush) ・ Compartilhado (flush, non-flush)', jpy: '' },
        attributes: { top: '47%', left: '39.6%', font_size: '10', width: '50%', text_align: 'right', height: '1.5%', class_name: 'document-translation' }
      },

      yesNoL: {
        translations: { en: 'Yes・No', po: 'Sim・Não', jpy: '' },
        attributes: { top: '49%', left: '54.4%', font_size: '10', class_name: 'document-translation' }
      },

      yesNoR: {
        translations: { en: 'Yes・No', po: 'Sim・Não', jpy: '' },
        attributes: { top: '49%', left: '83.6%', font_size: '10', class_name: 'document-translation' }
      },

      bathTub: {
        translations: { en: 'Bath Tub', po: 'Banheira', jpy: '' },
        attributes: { top: '52%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      shower: {
        translations: { en: 'Shower', po: 'Chuveiro', jpy: '' },
        attributes: { top: '54.8%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      washBasin: {
        translations: { en: 'Wash Basin', po: 'Lavatório', jpy: '' },
        attributes: { top: '57.6%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      washerArea: {
        translations: { en: 'Washer Area', po: 'Lavadora de área', jpy: '' },
        attributes: { top: '60.4%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      waterHeater: {
        translations: { en: 'Water Heater', po: 'Aquecedor de água', jpy: '' },
        attributes: { top: '63.2%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      kitchenStove: {
        translations: { en: 'Kitchen Stove', po: 'Fogão de cozinha', jpy: '' },
        attributes: { top: '66%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      parcelBox: {
        translations: { en: 'Parcel Box', po: 'Caixa de encomendas', jpy: '' },
        attributes: { top: '68.8%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      lock_key: {
        translations: { en: 'Key', po: 'Chave', jpy: '' },
        attributes: { top: '71.5%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      ac: {
        translations: { en: 'A/C', po: 'A/C', jpy: '' },
        attributes: { top: '52%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      fixedLighting: {
        translations: { en: 'Fixed Lighting', po: 'Iluminação Fixa', jpy: '' },
        attributes: { top: '54.8%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      autoLock: {
        translations: { en: 'Auto Lock', po: 'Bloqueio automático', jpy: '' },
        attributes: { top: '57.6%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      digitalTv: {
        translations: { en: 'Digital TV・CATV Ready', po: 'TV digital · CATV Ready', jpy: '' },
        attributes: { top: '60.4%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      internetReady: {
        translations: { en: 'Internet Ready', po: 'Pronto para Internet', jpy: '' },
        attributes: { top: '63.2%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      mailBox: {
        translations: { en: 'Mail Box', po: 'Caixa de correio', jpy: '' },
        attributes: { top: '66%', left: '62.2%', font_size: '10', class_name: 'document-translation' }
      },

      key: {
        translations: { en: 'Key No.', po: 'Key No.', jpy: '' },
        attributes: { top: '74.2%', left: '31.7%', font_size: '10', class_name: 'document-translation' }
      },

      sets: {
        translations: { en: 'Sets', po: 'Conjuntos', jpy: '' },
        attributes: { top: '74.2%', left: '54.2%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' }
      },

      electricCapacity: {
        translations: { en: 'Electric Capacity', po: 'Capacidade Elétrica', jpy: '' },
        attributes: { top: '77.4%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      gas: {
        translations: { en: 'Gas', po: 'Gás', jpy: '' },
        attributes: { top: '81%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      water: {
        translations: { en: 'Water', po: 'Agua', jpy: '' },
        attributes: { top: '85%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      sewage: {
        translations: { en: 'Sewage', po: 'Esgoto', jpy: '' },
        attributes: { top: '89%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
      },

      amperes: {
        translations: { en: 'Amperes', po: 'Amperes', jpy: '' },
        attributes: { top: '77%', left: '61.9%', font_size: '10', class_name: 'document-translation' }
      },

      gasAvailabiity: {
        translations: { en: 'Yes (City Gas・Propane Gas) ・ None', po: 'Sim (Gás Cidade ・ Gás Propano) ・ Nenhum', jpy: '' },
        attributes: { top: '81%', left: '48.6%', font_size: '10', class_name: 'document-translation' }
      },

      waterAvailability: {
        translations: { en: 'Direct Link to Public Water・Water Tank ・ Well Water', po: 'Link direto para a água pública ・ Tanque de água ・ Água de poço', jpy: '' },
        attributes: { top: '85%', left: '48.6%', font_size: '10', class_name: 'document-translation' }
      },

      sewageAvailability: {
        translations: { en: 'Yes (Public Sewage・Septic Tank) ・ None', po: 'Sim (Esgoto Público ・ Fossa Séptica) ・ Nenhum', jpy: '' },
        attributes: { top: '89%', left: '48.6%', font_size: '10', class_name: 'document-translation' }
      }
  },
  2 => {
    unitInformation: {
      translations: { en: 'Unit Information (Continued)', po: '', jpy: '' },
      attributes: { top: '23.5%', left: '16.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' }
    },

    facilities: {
      translations: { en: 'Facilities', po: '', jpy: '' },
      attributes: { top: '19.5%', left: '24.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' }
    },

    includedNotIncluded: {
      translations: { en: 'Included・Not Included', po: '', jpy: '' },
      attributes: { top: '7.7%', left: '45.6%', font_size: '10', class_name: 'document-translation' }
    },

    parking: {
      translations: { en: 'Parking', po: '', jpy: '' },
      attributes: { top: '10.7%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    bicycleParking: {
      translations: { en: 'Bicycle Parking', po: '', jpy: '' },
      attributes: { top: '14.3%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    motocycleParking: {
      translations: { en: 'Motorcycle Parking', po: '', jpy: '' },
      attributes: { top: '17.9%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    storage: {
      translations: { en: 'Storage', po: '', jpy: '' },
      attributes: { top: '21.2%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    ownYard: {
      translations: { en: 'Own Yard', po: '', jpy: '' },
      attributes: { top: '24.8%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    vehicles: {
      translations: { en: 'Vehicles', po: '', jpy: '' },
      attributes: { top: '10.7%', left: '64.9%', font_size: '10', class_name: 'document-translation' }
    },

    spaceNo: {
      translations: { en: 'Space No.', po: '', jpy: '' },
      attributes: { top: '10.7%', left: '71.5%', font_size: '10', class_name: 'document-translation' }
    },

    vehicles1: {
      translations: { en: 'Vehicles', po: '', jpy: '' },
      attributes: { top: '14.3%', left: '64.9%', font_size: '10', class_name: 'document-translation' }
    },

    spaceNo1: {
      translations: { en: 'Space No.', po: '', jpy: '' },
      attributes: { top: '14.3%', left: '71.5%', font_size: '10', class_name: 'document-translation' }
    },

    vehicles2: {
      translations: { en: 'Vehicles', po: '', jpy: '' },
      attributes: { top: '17.9%', left: '64.9%', font_size: '10', class_name: 'document-translation' }
    },

    spaceNo2: {
      translations: { en: 'Space No.', po: '', jpy: '' },
      attributes: { top: '17.9%', left: '71.5%', font_size: '10', class_name: 'document-translation' }
    },

    contractPeriod: {
      translations: { en: 'Contract Period', po: '', jpy: '' },
      attributes: { top: '33%', left: '28%', font_size: '10', class_name: 'document-translation' }
    },

    start: {
      translations: { en: 'Start', po: '', jpy: '' },
      attributes: { top: '35.9%', left: '14.2%', font_size: '10', class_name: 'document-translation' }
    },

    end: {
      translations: { en: 'End', po: '', jpy: '' },
      attributes: { top: '38.7%', left: '14.2%', font_size: '10', class_name: 'document-translation' }
    },

    year: {
      translations: { en: 'Year', po: '', jpy: '' },
      attributes: { top: '35.9%', left: '33%', font_size: '10', class_name: 'document-translation' }
    },

    month: {
      translations: { en: 'Month', po: '', jpy: '' },
      attributes: { top: '35.9%', left: '44%', font_size: '10', class_name: 'document-translation' }
    },

    day: {
      translations: { en: 'Day', po: '', jpy: '' },
      attributes: { top: '35.9%', left: '55.2%', font_size: '10', class_name: 'document-translation' }
    },

    year1: {
      translations: { en: 'Year', po: '', jpy: '' },
      attributes: { top: '38.7%', left: '33%', font_size: '10', class_name: 'document-translation' }
    },

    month1: {
      translations: { en: 'Month', po: '', jpy: '' },
      attributes: { top: '38.7%', left: '44%', font_size: '10', class_name: 'document-translation' }
    },

    day1: {
      translations: { en: 'Day', po: '', jpy: '' },
      attributes: { top: '38.7%', left: '55.2%', font_size: '10', class_name: 'document-translation' }
    },

    years: {
      translations: { en: 'Year(s)', po: '', jpy: '' },
      attributes: { top: '37.4%', left: '76%', font_size: '10', class_name: 'document-translation' }
    },

    months: {
      translations: { en: 'Month(s)', po: '', jpy: '' },
      attributes: { top: '37.4%', left: '83.5%', font_size: '10', class_name: 'document-translation' }
    },

    contractNoticePeriod: {
      translations: { en: 'Notice of contract conclusion to be served from', po: '', jpy: '' },
      attributes: { top: '41.7%', left: '14.2%', font_size: '10', class_name: 'document-translation' }
    },

    noticeYear: {
      translations: { en: 'Year', po: '', jpy: '' },
      attributes: { top: '41.7%', left: '48.3%', font_size: '10', class_name: 'document-translation' }
    },

    noticeMonth: {
      translations: { en: 'Month', po: '', jpy: '' },
      attributes: { top: '41.7%', left: '53.9%', font_size: '10', class_name: 'document-translation' }
    },

    noticeDay: {
      translations: { en: 'Day', po: '', jpy: '' },
      attributes: { top: '41.7%', left: '59.6%', font_size: '10', class_name: 'document-translation' }
    },

    noticeTo: {
      translations: { en: 'to', po: '', jpy: '' },
      attributes: { top: '41.7%', left: '64.6%', font_size: '10', class_name: 'document-translation' }
    },

    noticeYear1: {
      translations: { en: 'Year', po: '', jpy: '' },
      attributes: { top: '41.7%', left: '70.5%', font_size: '10', class_name: 'document-translation' }
    },

    noticeMonth1: {
      translations: { en: 'Month', po: '', jpy: '' },
      attributes: { top: '41.7%', left: '76%', font_size: '10', class_name: 'document-translation' }
    },

    noticeDay1: {
      translations: { en: 'Day', po: '', jpy: '' },
      attributes: { top: '41.7%', left: '81.7%', font_size: '10', class_name: 'document-translation' }
    },

    rentAndOthers: {
      translations: { en: 'Rent & Others', po: '', jpy: '' },
      attributes: { top: '45.2%', left: '25.7%', font_size: '10', class_name: 'document-translation' }
    },

    rentAndFees: {
      translations: { en: 'Rent・Fees', po: '', jpy: '' },
      attributes: { top: '48.2%', left: '19.4%', font_size: '10', class_name: 'document-translation' }
    },

    dueDates: {
      translations: { en: 'Payment Due', po: '', jpy: '' },
      attributes: { top: '48.2%', left: '41.6%', font_size: '10', class_name: 'document-translation' }
    },

    paymentMethod: {
      translations: { en: 'Payment Method', po: '', jpy: '' },
      attributes: { top: '48.2%', left: '68.6%', font_size: '10', class_name: 'document-translation' }
    },

    rent: {
      translations: { en: 'Rent', po: '', jpy: '' },
      attributes: { top: '51.4%', left: '15.5%', font_size: '10', class_name: 'document-translation' }
    },

    jpy: {
      translations: { en: 'JPY', po: '', jpy: '' },
      attributes: { top: '54%', left: '34.1%', font_size: '10', class_name: 'document-translation' }
    },

    rentDueDate: {
      translations: { en: 'Current Month Rent Due Date Each Month', po: '', jpy: '' },
      attributes: { top: '53.4%', left: '38.1%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    Fees: {
      translations: { en: 'Fees', po: '', jpy: '' },
      attributes: { top: '57.9%', left: '14.1%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    jpy1: {
      translations: { en: 'JPY', po: '', jpy: '' },
      attributes: { top: '80%', left: '34.1%', font_size: '10', class_name: 'document-translation' }
    },

    feesDueDate: {
      translations: { en: 'Current Month Fees Due Date Each Month', po: '', jpy: '' },
      attributes: { top: '70%', left: '38.1%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    accountOrInPerson: {
      translations: { en: 'Bank Wire or In Person', po: '', jpy: '' },
      attributes: { top: '68.4%', left: '54%', font_size: '10', class_name: 'document-translation', width: '5%' }
    },

    bankName: {
      translations: { en: 'Bank Name', po: '', jpy: '' },
      attributes: { top: '53.1%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    accountType: {
      translations: { en: 'Account Type: Ordinary・Current', po: '', jpy: '' },
      attributes: { top: '58.3%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    accountNumber: {
      translations: { en: 'A/C No.', po: '', jpy: '' },
      attributes: { top: '61.6%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    accountName: {
      translations: { en: 'Account Name', po: '', jpy: '' },
      attributes: { top: '70%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    transferFeePaidBy: {
      translations: { en: 'Transfer Fee Paid By: Landlor・Tenant', po: '', jpy: '' },
      attributes: { top: '75%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    paidInPerson: {
      translations: { en: 'Paid in Person', po: '', jpy: '' },
      attributes: { top: '79.4%', left: '60.4%', font_size: '10', class_name: 'document-translation' }
    },

    deposit: {
      translations: { en: 'Deposit', po: '', jpy: '' },
      attributes: { top: '83.5%', left: '14%', font_size: '10', class_name: 'document-translation' }
    },

    rentDepositX: {
      translations: { en: 'Rent x No. of Months', po: '', jpy: '' },
      attributes: { top: '83.5%', left: '22.3%', font_size: '10', class_name: 'document-translation' }
    },

    jpyDeposit: {
      translations: { en: 'JPY', po: '', jpy: '' },
      attributes: { top: '83.5%', left: '63.5%', font_size: '10', class_name: 'document-translation' }
    },

    facilityUsageFee: {
      translations: { en: 'Facility Usage Fee', po: '', jpy: '' },
      attributes: { top: '86.5%', left: '14.8%', font_size: '10', class_name: 'document-translation' }
    },

    others: {
      translations: { en: 'Others', po: '', jpy: '' },
      attributes: { top: '89.5%', left: '17%', font_size: '10', class_name: 'document-translation' }
    }
  },
  3 => {
    landlordAndManagemement: {
      translations: { en: 'Landlord & Management', po: '', jpy: '' },
      attributes: { top: '7.7%', left: '37%', font_size: '10', class_name: 'document-translation' }
    },

    landlordCompanyAndRepresentative: {
      translations: { en: 'Landlord (Company Name ・ Representative)', po: '', jpy: '' },
      attributes: { top: '16.5%', left: '15.5%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    landlordAddress: {
      translations: { en: 'Address', po: '', jpy: '' },
      attributes: { top: '11.5%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    landordCompanyName: {
      translations: { en: 'Company', po: '', jpy: '' },
      attributes: { top: '15.2%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    landlordName: {
      translations: { en: 'Representative', po: '', jpy: '' },
      attributes: { top: '19.3%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    landlordPhone: {
      translations: { en: 'Phone', po: '', jpy: '' },
      attributes: { top: '15%', left: '63.5%', font_size: '10', class_name: 'document-translation' }
    },

    managementCompanyAndRepresentative: {
      translations: { en: 'Management (Company Name ・ Representative)', po: '', jpy: '' },
      attributes: { top: '29.5%', left: '15.5%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    managementAddress: {
      translations: { en: 'Address', po: '', jpy: '' },
      attributes: { top: '23.2%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    managementCompany: {
      translations: { en: 'Company', po: '', jpy: '' },
      attributes: { top: '26.8%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    managementName: {
      translations: { en: 'Representative', po: '', jpy: '' },
      attributes: { top: '30.8%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    managementPhone: {
      translations: { en: 'Phone', po: '', jpy: '' },
      attributes: { top: '26.6%', left: '63.5%', font_size: '10', class_name: 'document-translation' }
    },

    registration: {
      translations: { en: 'Registration No.', po: '', jpy: '' },
      attributes: { top: '34%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    ministersRegistration: {
      translations: { en: 'Land & Transportation Minister', po: '', jpy: '' },
      attributes: { top: '34%', left: '55.7%', font_size: '10', class_name: 'document-translation' }
    },

    ifOwnerLandordDifferent: {
      translations: { en: 'Fill-in below if owner is different from landlord', po: '', jpy: '' },
      attributes: { top: '37.2%', left: '17.4%', font_size: '10', class_name: 'document-translation' }
    },

    propertyOwner: {
      translations: { en: 'Property Owner', po: '', jpy: '' },
      attributes: { top: '42.5%', left: '15.9%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    ownerAddress: {
      translations: { en: 'Address', po: '', jpy: '' },
      attributes: { top: '41.2%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    ownerCompany: {
      translations: { en: 'Company', po: '', jpy: '' },
      attributes: { top: '44.9%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    ownertName: {
      translations: { en: 'Representative', po: '', jpy: '' },
      attributes: { top: '48.6%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    ownerPhone: {
      translations: { en: 'Phone', po: '', jpy: '' },
      attributes: { top: '44.5%', left: '63.5%', font_size: '10', class_name: 'document-translation' }
    },

    tenantAndCoTenants: {
      translations: { en: 'Tenant and Co-tenants', po: '', jpy: '' },
      attributes: { top: '52.1%', left: '35.4%', font_size: '10', class_name: 'document-translation' }
    },

    nameHeading: {
      translations: { en: 'Name', po: '', jpy: '' },
      attributes: { top: '62.5%', left: '15.4%', font_size: '10', class_name: 'document-translation' }
    },

    tenant: {
      translations: { en: 'Tenant', po: '', jpy: '' },
      attributes: { top: '54%', left: '39.4%', font_size: '10', class_name: 'document-translation' }
    },

    cotenant: {
      translations: { en: 'Co-tenants', po: '', jpy: '' },
      attributes: { top: '54%', left: '74.4%', font_size: '10', class_name: 'document-translation' }
    },

    nameTenant: {
      translations: { en: 'Name', po: '', jpy: '' },
      attributes: { top: '57.8%', left: '24.4%', font_size: '10', class_name: 'document-translation' }
    },

    ageTenant: {
      translations: { en: 'Age', po: '', jpy: '' },
      attributes: { top: '60.8%', left: '24.4%', font_size: '10', class_name: 'document-translation' }
    },

    yearsTenant: {
      translations: { en: 'Years', po: '', jpy: '' },
      attributes: { top: '60.8%', left: '38%', font_size: '10', class_name: 'document-translation' }
    },

    phoneTenant: {
      translations: { en: 'Phone', po: '', jpy: '' },
      attributes: { top: '63.6%', left: '24.4%', font_size: '10', class_name: 'document-translation' }
    },

    nameCoTenant: {
      translations: { en: 'Name', po: '', jpy: '' },
      attributes: { top: '57%', left: '48.4%', font_size: '10', class_name: 'document-translation' }
    },

    nameCoTenant1: {
      translations: { en: 'Name', po: '', jpy: '' },
      attributes: { top: '60.1%', left: '48.4%', font_size: '10', class_name: 'document-translation' }
    },

    nameCoTenant2: {
      translations: { en: 'Name', po: '', jpy: '' },
      attributes: { top: '63.2%', left: '48.4%', font_size: '10', class_name: 'document-translation' }
    },

    ageCoTenant: {
      translations: { en: 'Age', po: '', jpy: '' },
      attributes: { top: '57%', left: '77%', font_size: '10', class_name: 'document-translation' }
    },

    ageCoTenant1: {
      translations: { en: 'Age', po: '', jpy: '' },
      attributes: { top: '60.1%', left: '77%', font_size: '10', class_name: 'document-translation' }
    },

    ageCoTenant2: {
      translations: { en: 'Age', po: '', jpy: '' },
      attributes: { top: '63.2%', left: '77%', font_size: '10', class_name: 'document-translation' }
    },

    yearsCoTenant: {
      translations: { en: 'Years', po: '', jpy: '' },
      attributes: { top: '57%', left: '86.5%', font_size: '10', class_name: 'document-translation' }
    },

    yearsCoTenant1: {
      translations: { en: 'Years', po: '', jpy: '' },
      attributes: { top: '60.1%', left: '86.5%', font_size: '10', class_name: 'document-translation' }
    },

    yearsCoTenant2: {
      translations: { en: 'Years', po: '', jpy: '' },
      attributes: { top: '63.2%', left: '86.5%', font_size: '10', class_name: 'document-translation' }
    },

    totalPersons: {
      translations: { en: 'Total No. Persons', po: '', jpy: '' },
      attributes: { top: '66.1%', left: '78.5%', font_size: '10', class_name: 'document-translation' }
    },

    emergencyContact: {
      translations: { en: 'Emergency Contact', po: '', jpy: '' },
      attributes: { top: '69.3%', left: '15.6%', font_size: '10', class_name: 'document-translation' }
    },

    address: {
      translations: { en: 'Address', po: '', jpy: '' },
      attributes: { top: '69%', left: '31.8%', font_size: '10', class_name: 'document-translation' }
    },

    name: {
      translations: { en: 'Name', po: '', jpy: '' },
      attributes: { top: '70.4%', left: '35.8%', font_size: '10', class_name: 'document-translation' }
    },

    phone: {
      translations: { en: 'Phone', po: '', jpy: '' },
      attributes: { top: '70.4%', left: '58.3%', font_size: '10', class_name: 'document-translation' }
    },

    relationship: {
      translations: { en: 'Relationship', po: '', jpy: '' },
      attributes: { top: '70.4%', left: '82.2%', font_size: '10', class_name: 'document-translation' }
    },

    guaranteeByGuarantyCompanyHeading: {
      translations: { en: 'Guarantee by Guaranty Company', po: '', jpy: '' },
      attributes: { top: '74.8%', left: '55.3%', font_size: '10', class_name: 'document-translation' }
    },

    guaranteeByGuarantyCompany: {
      translations: { en: 'Guarantee by Guaranty Company', po: '', jpy: '' },
      attributes: { top: '84.4%', left: '14.2%', font_size: '10', class_name: 'document-translation', width: '14%' }
    },

    addressGuarantee: {
      translations: { en: 'Address', po: '', jpy: '' },
      attributes: { top: '79.5%', left: '30.9%', font_size: '10', class_name: 'document-translation' }
    },

    nameGuarantee: {
      translations: { en: 'Name', po: '', jpy: '' },
      attributes: { top: '84.5%', left: '31%', font_size: '10', class_name: 'document-translation' }
    },

    phoneGuarantee: {
      translations: { en: 'Phone', po: '', jpy: '' },
      attributes: { top: '83.4%', left: '63.1%', font_size: '10', class_name: 'document-translation' }
    },

    registrationGuarantee: {
      translations: { en: 'Registration No.', po: '', jpy: '' },
      attributes: { top: '88.9%', left: '31%', font_size: '10', class_name: 'document-translation' }
    },

    ministersRegistrationGuarantee: {
      translations: { en: 'Land & Transportation Minister', po: '', jpy: '' },
      attributes: { top: '88.9%', left: '55.7%', font_size: '10', class_name: 'document-translation' }
    }
  },
  12 => {
    signedAndSealed: {
      translations: { en: 'To be signed and sealed below', po: '', jpy: '' },
      attributes: { top: '8.8%', left: '22.7%', font_size: '10', class_name: 'document-translation', font_weight: 'bold' }
    },

    inWitnessWhereOf: {
      translations: { en: 'IN WITNESS WHEREOF, the following Landlord and the Tenant have signed and affixed their seals to the Contract in duplicate, each party retaining one sealed copy.', po: '', jpy: '' },
      attributes: { top: '15.8%', left: '16.3%', font_size: '10', class_name: 'document-translation', width: '76.5%' }
    },

    year: {
      translations: { en: 'Year', po: '', jpy: '' },
      attributes: { top: '20.8%', left: '27.7%', font_size: '10', class_name: 'document-translation' }
    },

    month: {
      translations: { en: 'Month', po: '', jpy: '' },
      attributes: { top: '20.8%', left: '37.3%', font_size: '10', class_name: 'document-translation' }
    },

    day: {
      translations: { en: 'Day', po: '', jpy: '' },
      attributes: { top: '20.8%', left: '47.3%', font_size: '10', class_name: 'document-translation' }
    },

    landlord: {
      translations: { en: 'Landlord', po: '', jpy: '' },
      attributes: { top: '25%', left: '14.5%', font_size: '10', class_name: 'document-translation' }
    },

    addressLandord: {
      translations: { en: 'Address', po: '', jpy: '' },
      attributes: { top: '25.5%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    nameLandlord: {
      translations: { en: 'Name', po: '', jpy: '' },
      attributes: { top: '30%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    phoneLandlord: {
      translations: { en: 'Phone', po: '', jpy: '' },
      attributes: { top: '34%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    sealLandlord: {
      translations: { en: 'Seal', po: '', jpy: '' },
      attributes: { top: '31.2%', left: '82%', font_size: '10', class_name: 'document-translation' }
    },

    tenant: {
      translations: { en: 'Tenant', po: '', jpy: '' },
      attributes: { top: '38.5%', left: '14.5%', font_size: '10', class_name: 'document-translation' }
    },

    addressTenant: {
      translations: { en: 'Address', po: '', jpy: '' },
      attributes: { top: '38.5%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    nameTenant: {
      translations: { en: 'Name', po: '', jpy: '' },
      attributes: { top: '43%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    phoneTenant: {
      translations: { en: 'Phone', po: '', jpy: '' },
      attributes: { top: '47.5%', left: '26.7%', font_size: '10', class_name: 'document-translation' }
    },

    sealTenant: {
      translations: { en: 'Seal', po: '', jpy: '' },
      attributes: { top: '45%', left: '82%', font_size: '10', class_name: 'document-translation' }
    },

    intermediary: {
      translations: { en: 'Intermediary', po: '', jpy: '' },
      attributes: { top: '56%', left: '14.5%', font_size: '10', class_name: 'document-translation' }
    },

    broker: {
      translations: { en: 'Broker', po: '', jpy: '' },
      attributes: { top: '60.5%', left: '14.5%', font_size: '10', class_name: 'document-translation' }
    },

    agent: {
      translations: { en: 'Agent', po: '', jpy: '' },
      attributes: { top: '64%', left: '14.5%', font_size: '10', class_name: 'document-translation' }
    },

    license: {
      translations: { en: 'License No.', po: '', jpy: '' },
      attributes: { top: '56%', left: '27%', font_size: '10', class_name: 'document-translation' }
    },

    governor: {
      translations: { en: 'Governor', po: '', jpy: '' },
      attributes: { top: '56%', left: '47%', font_size: '10', class_name: 'document-translation' }
    },

    minister: {
      translations: { en: 'Minister', po: '', jpy: '' },
      attributes: { top: '56%', left: '55%', font_size: '10', class_name: 'document-translation' }
    },

    brokerAddress: {
      translations: { en: 'Address', po: '', jpy: '' },
      attributes: { top: '64.5%', left: '27%', font_size: '10', class_name: 'document-translation' }
    },

    brokerCompanyName: {
      translations: { en: 'Company Name', po: '', jpy: '' },
      attributes: { top: '69%', left: '27%', font_size: '10', class_name: 'document-translation' }
    },

    brokerRepresentative: {
      translations: { en: 'Representative', po: '', jpy: '' },
      attributes: { top: '73.3%', left: '27%', font_size: '10', class_name: 'document-translation' }
    },

    sealBrokerCompany: {
      translations: { en: 'Seal', po: '', jpy: '' },
      attributes: { top: '73.3%', left: '65.5%', font_size: '10', class_name: 'document-translation' }
    },

    registeredBroker: {
      translations: { en: 'Registered Real Estate Broker', po: '', jpy: '' },
      attributes: { top: '77.3%', left: '27%', font_size: '10', class_name: 'document-translation' }
    },

    licenseNumber: {
      translations: { en: 'License No.', po: '', jpy: '' },
      attributes: { top: '77.3%', left: '48.9%', font_size: '10', class_name: 'document-translation' }
    },

    governorBroker: {
      translations: { en: 'Governor', po: '', jpy: '' },
      attributes: { top: '77.3%', left: '71.2%', font_size: '10', class_name: 'document-translation' }
    },

    nameBroker: {
      translations: { en: 'Name', po: '', jpy: '' },
      attributes: { top: '82.4%', left: '48.9%', font_size: '10', class_name: 'document-translation' }
    },

    sealBroker: {
      translations: { en: 'Seal', po: '', jpy: '' },
      attributes: { top: '82.4%', left: '87%', font_size: '10', class_name: 'document-translation' }
    },
  }
};
    # object = fixed_term_rental
    return object
  end
end

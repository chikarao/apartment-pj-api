module DocumentTranslationFixedTermAll
  # CONTANT for fetch_translation and save and create agreement in booking
  # def fixed_term_rental_contract_translation
    # include FixedTermRentalContractTranslation
    OBJECT = {
      # 1 => {
      documentTitle: {
        translations: { en: 'Fixed Term Rental Contract', po: 'Contrato de Locação a Prazo Fixo', jp: '定期賃貸住宅契約書' },
        attributes: { top: '10.5%', left: '27.5%', font_size: '12', width: '45%', text_align: 'center', height: '1.5%', class_name: 'document-translation', font_weight: 'bold' },
        category: 'document'
      },

      heading: {
        translations: { en: 'Heading', po: 'Topo', jp: '頭書類' },
        attributes: { top: '12.8%', left: '17%', font_size: '10', class_name: 'document-translation', font_weight: 'bold' },
        category: 'document'
      },

      rentalInformation: {
        translations: { en: 'Rental Information', po: 'Informação de Aluguel', jp: '賃貸借の目的' },
        attributes: { top: '14.5%', left: '32.5%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      buildingName: {
        translations: { en: 'Name', po: 'Nome', jp: '名称' },
        examples: { en: 'The Building Name', p: 'O nome do Edifício'},
        attributes: { top: '18.8%', left: '22.5%', font_size: '10', class_name: 'document-translation' },
        category: 'building'
      },

      buildingAddress: {
        translations: { en: 'Address', po: 'Endereço', jp: '所在地' },
        attributes: { top: '23.3%', left: '22%', font_size: '10', class_name: 'document-translation' },
        category: 'building'
      },

      buildingInformation: {
        translations: { en: 'Building Information', po: 'Informação de construção', jp: '建物の名称・所在地等' },
        attributes: { top: '34%', left: '16.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' },
        category: 'building'
      },

      buildingType: {
        translations: { en: 'Building Type', po: 'Tipo de construção', jp: '建物の種類' },
        attributes: { top: '33%', left: '20.5%', font_size: '10', width: '10%', class_name: 'document-translation' },
        category: 'building',
        group: 'type'
      },

      apartment: {
        translations: { en: 'Apartment', po: 'Apartamento', jp: '' },
        attributes: { top: '26.7%', left: '34%', font_size: '10', class_name: 'document-translation' },
        category: 'building',
        group: 'type'
      },

      townhouse: {
        translations: { en: 'Townhouse', po: 'Moradia', jp: '' },
        attributes: { top: '30.5%', left: '34%', font_size: '10', class_name: 'document-translation' },
        category: 'building',
        group: 'type'
      },

      singleFamily: {
        translations: { en: 'Single Family', po: 'Única família', jp: '' },
        attributes: { top: '34.4%', left: '34%', font_size: '10', class_name: 'document-translation' },
        category: 'building',
        group: 'type'
      },

      other: {
        translations: { en: 'Other', po: 'De outros', jp: '' },
        attributes: { top: '37.8%', left: '34%', font_size: '10', class_name: 'document-translation' },
        category: 'building',
        group: 'type'
      },

      construction: {
        translations: { en: 'Construction', po: 'Construção', jp: '' },
        attributes: { top: '30.4%', left: '46.2%', font_size: '10', text_align: 'center', width: '9%', height: '1.5%', class_name: 'document-translation' },
        category: 'building',
        group: 'construction'
      },


      # floors: {
      #   translations: { en: 'Floors', po: 'Pavimentos', jp: '' },
      #   attributes: nil
      # },

      numberOfUnits: {
        translations: { en: 'No. of Units', po: 'Nº de Unidades', jp: '' },
        attributes: { top: '37.1%', left: '46.4%', font_size: '10', class_name: 'document-translation' },
        category: 'building'
      },

      wooden: {
        translations: { en: 'Wooden', po: 'De Madeira', jp: '' },
        attributes: { top: '26.5%', left: '58.4%', font_size: '10', class_name: 'document-translation' },
        category: 'building',
        group: 'construction'
      },

      nonWood: {
        translations: { en: 'Non-wood', po: 'Não Madeira', jp: '' },
        attributes: { top: '29.3%', left: '58.4%', font_size: '10', class_name: 'document-translation' },
        category: 'building',
        group: 'construction'
      },

      unit: {
        translations: { en: 'Unit', po: 'Unidade', jp: '' },
        attributes: { top: '37.1%', left: '56.4%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' },
        category: 'flat'
      },

      stories: {
        translations: { en: 'Stories', po: 'Pavimentos', jp: '階建' },
        attributes: { top: '33.3%', left: '56.3%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' },
        category: 'building'
      },

      story: {
        translations: { en: 'Story', po: 'Pavimento', jp: '階' },
        attributes: { top: '33.3%', left: '56.3%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' },
        category: 'flat'
      },

      yearBuilt: {
        translations: { en: 'Year Built', po: 'Ano de Construção', jp: '' },
        attributes: { top: '26.5%', left: '76.9%', font_size: '10', class_name: 'document-translation' },
        examples: { en: '2000', po: '2000'},
        category: 'building'
      },

      majorRenovation: {
        translations: { en: 'Major Renovation', po: 'Renovação Principal', jp: '' },
        attributes: { top: '32.1%', left: '75.6%', font_size: '10', class_name: 'document-translation' },
        examples: { en: '2010', po: '2010'},
        category: 'building'
      },

      completed: {
        translations: { en: 'Completed', po: 'Concluído', jp: '' },
        attributes: { top: '36.5%', left: '77.4%', font_size: '10', class_name: 'document-translation' },
        category: 'building'
      },

      unitInformation: {
        translations: { en: 'Unit Information', po: 'Informação da Unidade', jp: '' },
        attributes: { top: '69.3%', left: '16.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' },
        category: 'flat'
      },

      equipment: {
        translations: { en: 'Equipment', po: 'Equipamento', jp: '' },
        attributes: { top: '71%', left: '23.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' },
        category: 'amenity'
      },

      unitNumber: {
        translations: { en: 'Unit Number', po: 'Unidade Não.', jp: '' },
        attributes: { top: '41%', left: '20.1%', font_size: '10', class_name: 'document-translation' },
        category: 'flat'
      },

      unitNo: {
        translations: { en: 'Unit No.', po: 'Unidade', jp: '' },
        attributes: { top: '41%', left: '29.5%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' },
        category: 'flat'
      },

      layout: {
        translations: { en: 'Layout', po: 'Layout', jp: '' },
        attributes: { top: '41%', left: '48%', font_size: '10', class_name: 'document-translation' },
        category: 'flat'
      },

      rooms: {
        translations: { en: 'Rooms', po: 'Quartos', jp: '' },
        attributes: { top: '41%', left: '48%', font_size: '10', class_name: 'document-translation' },
        category: 'flat'
      },

      oneRoom: {
        translations: { en: 'One Room', po: 'Um quarto', jp: '' },
        attributes: { top: '41%', left: '77.1%', font_size: '10', class_name: 'document-translation' },
        category: 'flat'
      },

      floorSpace: {
        translations: { en: 'Floor Space', po: 'Espaço no chão', jp: '' },
        attributes: { top: '44%', left: '20.1%', font_size: '10', class_name: 'document-translation' },
        category: 'flat'
      },

      balcony: {
        translations: { en: 'In addition, balcony', po: 'Além disso, varanda', jp: '' },
        attributes: { top: '44%', left: '57.1%', font_size: '10', class_name: 'document-translation' },
        category: 'flat'
      },

      toilet: {
        translations: { en: 'Toilet', po: 'Banheiro', jp: '' },
        attributes: { top: '47%', left: '31.1%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      toiletAvailability: {
        translations: { en: 'Own (flush・non-flush) ・Shared (flush・sem flush)', po: 'Próprio (flush, sem flush) ・ Compartilhado (flush, non-flush)', jp: '' },
        attributes: { top: '47%', left: '39.6%', font_size: '10', width: '50%', text_align: 'right', height: '1.5%', class_name: 'document-translation' },
        category: 'amenity'
      },

      yesNoL: {
        translations: { en: 'Yes・No', po: 'Sim・Não', jp: '' },
        attributes: { top: '49%', left: '54.4%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      yesNoR: {
        translations: { en: 'Yes・No', po: 'Sim・Não', jp: '' },
        attributes: { top: '49%', left: '83.6%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      bathTub: {
        translations: { en: 'Bath Tub', po: 'Banheira', jp: '浴槽' },
        attributes: { top: '52%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      shower: {
        translations: { en: 'Shower', po: 'Chuveiro', jp: 'シャワー' },
        attributes: { top: '54.8%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      washBasin: {
        translations: { en: 'Wash Basin', po: 'Lavatório', jp: '洗面台' },
        attributes: { top: '57.6%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      washerArea: {
        translations: { en: 'Washer Area', po: 'Lavadora de área', jp: '洗濯機台' },
        attributes: { top: '60.4%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      waterHeater: {
        translations: { en: 'Water Heater', po: 'Aquecedor de água', jp: '給湯器' },
        attributes: { top: '63.2%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      kitchenStove: {
        translations: { en: 'Kitchen Stove', po: 'Fogão de cozinha', jp: 'キッチンストーブ' },
        attributes: { top: '66%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      parcelBox: {
        translations: { en: 'Parcel Box', po: 'Caixa de encomendas', jp: '宅配箱' },
        attributes: { top: '68.8%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      lock_key: {
        translations: { en: 'Key', po: 'Chave', jp: 'ドアロック' },
        attributes: { top: '71.5%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      ac: {
        translations: { en: 'A/C', po: 'A/C', jp: 'エアコン' },
        attributes: { top: '52%', left: '62.2%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      fixedLighting: {
        translations: { en: 'Fixed Lighting', po: 'Iluminação Fixa', jp: '照明' },
        attributes: { top: '54.8%', left: '62.2%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      autoLock: {
        translations: { en: 'Auto Lock', po: 'Bloqueio automático', jp: 'オートロック' },
        attributes: { top: '57.6%', left: '62.2%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      digitalTv: {
        translations: { en: 'Digital TV・CATV Ready', po: 'TV digital · CATV Ready', jp: 'デジタルテレビ対応' },
        attributes: { top: '60.4%', left: '62.2%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      internetReady: {
        translations: { en: 'Internet Ready', po: 'Pronto para Internet', jp: 'インターネット対応' },
        attributes: { top: '63.2%', left: '62.2%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      mailBox: {
        translations: { en: 'Mail Box', po: 'Caixa de correio', jp: '投函箱' },
        attributes: { top: '66%', left: '62.2%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      key: {
        translations: { en: 'Key No.', po: 'Key No.', jp: '鍵' },
        attributes: { top: '74.2%', left: '31.7%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      sets: {
        translations: { en: 'Sets', po: 'Conjuntos', jp: '' },
        attributes: { top: '74.2%', left: '54.2%', font_size: '10', width: '14%', text_align: 'right', height: '1.5%', class_name: 'document-translation' },
        category: 'amenity'
      },

      electricCapacity: {
        translations: { en: 'Electric Capacity', po: 'Capacidade Elétrica', jp: '' },
        attributes: { top: '77.4%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      gas: {
        translations: { en: 'Gas', po: 'Gás', jp: '' },
        attributes: { top: '81%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'amenity'
      },

      water: {
        translations: { en: 'Water', po: 'Agua', jp: '水道' },
        attributes: { top: '85%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'utilities'
      },

      sewage: {
        translations: { en: 'Sewage', po: 'Esgoto', jp: '' },
        attributes: { top: '89%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'utilities'
      },

      amperes: {
        translations: { en: 'Amperes', po: 'Amperes', jp: '' },
        attributes: { top: '77%', left: '61.9%', font_size: '10', class_name: 'document-translation' },
        category: 'utilities'
      },

      gasAvailabiity: {
        translations: { en: 'Yes (City Gas・Propane Gas) ・ None', po: 'Sim (Gás Cidade ・ Gás Propano) ・ Nenhum', jp: '' },
        attributes: { top: '81%', left: '48.6%', font_size: '10', class_name: 'document-translation' },
        category: 'utilities'
      },

      waterAvailability: {
        translations: { en: 'Direct Link to Public Water・Water Tank ・ Well Water', po: 'Link direto para a água pública ・ Tanque de água ・ Água de poço', jp: '' },
        attributes: { top: '85%', left: '48.6%', font_size: '10', class_name: 'document-translation' },
        category: 'utilities'
      },

      sewageAvailability: {
        translations: { en: 'Yes (Public Sewage・Septic Tank) ・ None', po: 'Sim (Esgoto Público ・ Fossa Séptica) ・ Nenhum', jp: '' },
        attributes: { top: '89%', left: '48.6%', font_size: '10', class_name: 'document-translation' },
        category: 'utilities'
      },
  # },ß
  # 2 => {
      unitInformation1: {
        translations: { en: 'Unit Information (Continued)', po: '', jp: '' },
        attributes: { top: '23.5%', left: '16.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' }
      },

      facilities: {
        translations: { en: 'Facilities', po: '', jp: '' },
        attributes: { top: '19.5%', left: '24.5%', font_size: '10', width: '23%', height: '1.5%', class_name: 'document-translation', rotate: '90', transform_origin: 'top left' },
        category: 'facilities'
      },

      includedNotIncluded: {
        translations: { en: 'Included・Not Included', po: '', jp: '' },
        attributes: { top: '7.7%', left: '45.6%', font_size: '10', class_name: 'document-translation' },
        category: 'facilities'
      },

      parking: {
        translations: { en: 'Parking', po: '', jp: '' },
        attributes: { top: '10.7%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'facilities'
      },

      parkingIncluded: {
        translations: { en: 'Parking Included', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      parkingSpaces: {
        translations: { en: 'Parking Spaces', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      parkingNumber: {
        translations: { en: 'Parking Space No.', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      bicycleParking: {
        translations: { en: 'Bicycle Parking', po: '', jp: '' },
        attributes: { top: '14.3%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'facilities'
      },

      bicycleParkingIncluded: {
        translations: { en: 'Bicycle Parking Included', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      bicycleParkingSpaces: {
        translations: { en: 'Bicycle Parking Spaces', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      bicycleParkingNumber: {
        translations: { en: 'Bicycle Parking Space No.', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      motocycleParking: {
        translations: { en: 'Motorcycle Parking', po: '', jp: '' },
        attributes: { top: '17.9%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'facilities'
      },

      motocycleParkingIncluded: {
        translations: { en: 'Motorcycle Parking Included', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      motocycleParkingSpaces: {
        translations: { en: 'Motorcycle Parking Included', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      motocycleParkingNumber: {
        translations: { en: 'Motorcycle Parking Space No.', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      storage: {
        translations: { en: 'Storage', po: '', jp: '' },
        attributes: { top: '21.2%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'facilities'
      },

      storageIncluded: {
        translations: { en: 'Storage Included', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      storageSpaces: {
        translations: { en: 'Storage Spaces', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      storageNumber: {
        translations: { en: 'Storage Space No.', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      ownYard: {
        translations: { en: 'Own Yard', po: '', jp: '' },
        attributes: { top: '24.8%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'facilities'
      },

      otherFacility: {
        translations: { en: 'Other Facilities', po: '', jp: '' },
        attributes: nil,
        category: 'facilities'
      },

      vehicles: {
        translations: { en: 'Vehicles', po: '', jp: '' },
        attributes: { top: '10.7%', left: '64.9%', font_size: '10', class_name: 'document-translation' },
        category: 'facilities'
      },

      spaceNo: {
        translations: { en: 'Space No.', po: '', jp: '' },
        attributes: { top: '10.7%', left: '71.5%', font_size: '10', class_name: 'document-translation' },
        category: 'facilities'
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
        attributes: { top: '33%', left: '28%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      start: {
        translations: { en: 'Start', po: '', jp: '' },
        attributes: { top: '35.9%', left: '14.2%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      end: {
        translations: { en: 'End', po: '', jp: '' },
        attributes: { top: '38.7%', left: '14.2%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      yearFrom: {
        translations: { en: 'Year', po: '', jp: '' },
        attributes: { top: '35.9%', left: '33%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      monthFrom: {
        translations: { en: 'Month', po: '', jp: '' },
        attributes: { top: '35.9%', left: '44%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      dayFrom: {
        translations: { en: 'Day', po: '', jp: '' },
        attributes: { top: '35.9%', left: '55.2%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      yearTo: {
        translations: { en: 'Year', po: '', jp: '' },
        attributes: { top: '38.7%', left: '33%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      monthTo: {
        translations: { en: 'Month', po: '', jp: '' },
        attributes: { top: '38.7%', left: '44%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      dayTo: {
        translations: { en: 'Day', po: '', jp: '' },
        attributes: { top: '38.7%', left: '55.2%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      yearsContract: {
        translations: { en: 'Year(s)', po: '', jp: '' },
        attributes: { top: '37.4%', left: '76%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      monthsContract: {
        translations: { en: 'Month(s)', po: '', jp: '' },
        attributes: { top: '37.4%', left: '83.5%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      contractNoticePeriod: {
        translations: { en: 'Notice of contract conclusion to be served from', po: '', jp: '' },
        attributes: { top: '41.7%', left: '14.2%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      noticeYearFrom: {
        translations: { en: 'Year', po: '', jp: '' },
        attributes: { top: '41.7%', left: '48.3%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      noticeMonthFrom: {
        translations: { en: 'Month', po: '', jp: '' },
        attributes: { top: '41.7%', left: '53.9%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      noticeDayFrom: {
        translations: { en: 'Day', po: '', jp: '' },
        attributes: { top: '41.7%', left: '59.6%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      noticeTo: {
        translations: { en: 'to', po: '', jp: '' },
        attributes: { top: '41.7%', left: '64.6%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      noticeYearTo: {
        translations: { en: 'Year', po: '', jp: '' },
        attributes: { top: '41.7%', left: '70.5%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      noticeMonthTo: {
        translations: { en: 'Month', po: '', jp: '' },
        attributes: { top: '41.7%', left: '76%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      noticeDayTo: {
        translations: { en: 'Day', po: '', jp: '' },
        attributes: { top: '41.7%', left: '81.7%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      rentAndOthers: {
        translations: { en: 'Rent & Others', po: '', jp: '' },
        attributes: { top: '45.2%', left: '25.7%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      rentAndFees: {
        translations: { en: 'Rent・Fees', po: '', jp: '' },
        attributes: { top: '48.2%', left: '19.4%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      dueDates: {
        translations: { en: 'Payment Due', po: '', jp: '' },
        attributes: { top: '48.2%', left: '41.6%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      paymentMethod: {
        translations: { en: 'Payment Method', po: '', jp: '' },
        attributes: { top: '48.2%', left: '68.6%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      rent: {
        translations: { en: 'Rent', po: '', jp: '' },
        attributes: { top: '51.4%', left: '15.5%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      jp: {
        translations: { en: 'JPY', po: '', jp: '' },
        attributes: { top: '54%', left: '34.1%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      rentDueDate: {
        translations: { en: 'Current Month Rent Due Date Each Month', po: '', jp: '' },
        attributes: { top: '53.4%', left: '38.1%', font_size: '10', class_name: 'document-translation', width: '14%' },
        category: 'agreement'
      },

      rentDueDateEachMonth: {
        translations: { en: 'Rent Due Date Each Month', po: '', jp: '' },
        attributes: nil,
        category: 'agreement'
      },

      fees: {
        translations: { en: 'Fees', po: '', jp: '' },
        attributes: { top: '57.9%', left: '14.1%', font_size: '10', class_name: 'document-translation', width: '14%' },
        category: 'agreement'
      },

      jp1: {
        translations: { en: 'JPY', po: '', jp: '' },
        attributes: { top: '80%', left: '34.1%', font_size: '10', class_name: 'document-translation' }
      },

      feesDueDate: {
        translations: { en: 'Current Month Fees Due Date Each Month', po: '', jp: '' },
        attributes: { top: '70%', left: '38.1%', font_size: '10', class_name: 'document-translation', width: '14%' },
        category: 'agreement'
      },

      feesDueDateEachMonth: {
        translations: { en: 'Fees Due Date Each Month', po: '', jp: '' },
        attributes: nil,
        category: 'agreement'
      },

      accountOrInPerson: {
        translations: { en: 'Bank Wire or In Person', po: '', jp: '' },
        attributes: { top: '68.4%', left: '54%', font_size: '10', class_name: 'document-translation', width: '5%' },
        category: 'agreement'
      },

      bankName: {
        translations: { en: 'Bank Name', po: '', jp: '' },
        attributes: { top: '53.1%', left: '60.4%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      bankNameEnglish: {
        translations: { en: 'Bank Name English', po: '', jp: '' },
        attributes: nil,
        category: 'agreement'
      },

      accountType: {
        translations: { en: 'Account Type: Ordinary・Current', po: '', jp: '' },
        attributes: { top: '58.3%', left: '60.4%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      accountNumber: {
        translations: { en: 'A/C No.', po: '', jp: '' },
        attributes: { top: '61.6%', left: '60.4%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      swift: {
        translations: { en: 'SWIFT', po: '', jp: '' },
        attributes: nil,
        category: 'agreement'
      },

      accountName: {
        translations: { en: 'Account Name', po: '', jp: '' },
        attributes: { top: '70%', left: '60.4%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      accountNameAlphabet: {
        translations: { en: 'Account Name Alphabet', po: '', jp: '' },
        attributes: nil,
        category: 'agreement'
      },

      transferFeePaidBy: {
        translations: { en: 'Transfer Fee Paid By: Landlord・Tenant', po: '', jp: '' },
        attributes: { top: '75%', left: '60.4%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      rentPaymentMethod: {
        translations: { en: 'Rent Payment Method', po: '', jp: '' },
        attributes: nil,
        category: 'agreement'
      },

      paidInPerson: {
        translations: { en: 'Paid in Person', po: '', jp: '' },
        attributes: { top: '79.4%', left: '60.4%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      deposit: {
        translations: { en: 'Deposit', po: '', jp: '' },
        attributes: { top: '83.5%', left: '14%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      rentDepositX: {
        translations: { en: 'Rent x No. of Months', po: '', jp: '' },
        attributes: { top: '83.5%', left: '22.3%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      jpDeposit: {
        translations: { en: 'JPY', po: '', jp: '' },
        attributes: { top: '83.5%', left: '63.5%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      facilityUsageFee: {
        translations: { en: 'Facility Usage Fee', po: '', jp: '' },
        attributes: { top: '86.5%', left: '14.8%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      others: {
        translations: { en: 'Others', po: '', jp: '' },
        attributes: { top: '89.5%', left: '17%', font_size: '10', class_name: 'document-translation' },
        category: 'agreement'
      },

      otherFees: {
        translations: { en: 'Other Fees', po: '', jp: '' },
        attributes: nil,
        category: 'agreement'
      },
    # },
    # 3 => {
      landlordAndManagemement: {
        translations: { en: 'Landlord & Management', po: '', jp: '' },
        attributes: { top: '7.7%', left: '37%', font_size: '10', class_name: 'document-translation' },
        category: 'landlord'
      },

      landlordCompanyAndRepresentative: {
        translations: { en: 'Landlord (Company Name ・ Representative)', po: '', jp: '' },
        attributes: { top: '16.5%', left: '15.5%', font_size: '10', class_name: 'document-translation', width: '14%' },
        category: 'landlord'
      },

      landlordAddress: {
        translations: { en: 'Address', po: '', jp: '' },
        attributes: { top: '11.5%', left: '31.8%', font_size: '10', class_name: 'document-translation' },
        category: 'landlord'
      },

      landlordCompanyName: {
        translations: { en: 'Company', po: '', jp: '' },
        attributes: { top: '15.2%', left: '31.8%', font_size: '10', class_name: 'document-translation' },
        category: 'landlord'
      },

      landlordName: {
        translations: { en: 'Representative', po: '', jp: '' },
        attributes: { top: '19.3%', left: '31.8%', font_size: '10', class_name: 'document-translation' },
        category: 'landlord'
      },

      landlordPhone: {
        translations: { en: 'Phone', po: '', jp: '' },
        attributes: { top: '15%', left: '63.5%', font_size: '10', class_name: 'document-translation' },
        category: 'landlord'
      },

      managementCompanyAndRepresentative: {
        translations: { en: 'Management (Company Name ・ Representative)', po: '', jp: '' },
        attributes: { top: '29.5%', left: '15.5%', font_size: '10', class_name: 'document-translation', width: '14%' },
        category: 'management'
      },

      managementAddress: {
        translations: { en: 'Address', po: '', jp: '' },
        attributes: { top: '23.2%', left: '31.8%', font_size: '10', class_name: 'document-translation' },
        category: 'management'
      },

      managementCompany: {
        translations: { en: 'Company', po: '', jp: '' },
        attributes: { top: '26.8%', left: '31.8%', font_size: '10', class_name: 'document-translation' },
        category: 'management'
      },

      managementName: {
        translations: { en: 'Representative', po: '', jp: '' },
        attributes: { top: '30.8%', left: '31.8%', font_size: '10', class_name: 'document-translation' },
        category: 'management'
      },

      managementPhone: {
        translations: { en: 'Phone', po: '', jp: '' },
        attributes: { top: '26.6%', left: '63.5%', font_size: '10', class_name: 'document-translation' },
        category: 'management'
      },

      registration: {
        translations: { en: 'Registration No.', po: '', jp: '' },
        attributes: { top: '34%', left: '31.8%', font_size: '10', class_name: 'document-translation' },
        category: 'management'
      },

      registrationNoFirst: {
        translations: { en: 'Registration No. First Part', po: '', jp: '' },
        attributes: nil,
        category: 'management'
      },

      ministersRegistration: {
        translations: { en: 'Land & Transportation Minister', po: '', jp: '' },
        attributes: { top: '34%', left: '55.7%', font_size: '10', class_name: 'document-translation' },
        category: 'management'
      },

      ifOwnerLandlordDifferent: {
        translations: { en: 'Fill-in below if owner is different from landlord', po: '', jp: '' },
        attributes: { top: '37.2%', left: '17.4%', font_size: '10', class_name: 'document-translation' },
        category: 'landlord'
      },

      propertyOwner: {
        translations: { en: 'Property Owner', po: '', jp: '' },
        attributes: { top: '42.5%', left: '15.9%', font_size: '10', class_name: 'document-translation', width: '14%' },
        category: 'owner'
      },

      ownerAddress: {
        translations: { en: 'Address', po: '', jp: '' },
        attributes: { top: '41.2%', left: '31.8%', font_size: '10', class_name: 'document-translation' },
        category: 'owner'
      },

      ownerCompany: {
        translations: { en: 'Company', po: '', jp: '' },
        attributes: { top: '44.9%', left: '31.8%', font_size: '10', class_name: 'document-translation' },
        category: 'owner'
      },

      ownertName: {
        translations: { en: 'Representative', po: '', jp: '' },
        attributes: { top: '48.6%', left: '31.8%', font_size: '10', class_name: 'document-translation' },
        category: 'owner'
      },

      ownerPhone: {
        translations: { en: 'Phone', po: '', jp: '' },
        attributes: { top: '44.5%', left: '63.5%', font_size: '10', class_name: 'document-translation' },
        category: 'owner'
      },

      tenantAndCoTenants: {
        translations: { en: 'Tenant and Co-tenants', po: '', jp: '' },
        attributes: { top: '52.1%', left: '35.4%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      nameHeading: {
        translations: { en: 'Name', po: '', jp: '' },
        attributes: { top: '62.5%', left: '15.4%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      tenant: {
        translations: { en: 'Tenant', po: '', jp: '' },
        attributes: { top: '54%', left: '39.4%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      cotenant: {
        translations: { en: 'Co-tenants', po: '', jp: '' },
        attributes: { top: '54%', left: '74.4%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      nameTenant: {
        translations: { en: 'Name', po: '', jp: '' },
        attributes: { top: '57.8%', left: '24.4%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      ageTenant: {
        translations: { en: 'Age', po: '', jp: '' },
        attributes: { top: '60.8%', left: '24.4%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      yearsTenant: {
        translations: { en: 'Years', po: '', jp: '' },
        attributes: { top: '60.8%', left: '38%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      phoneTenant: {
        translations: { en: 'Phone', po: '', jp: '' },
        attributes: { top: '63.6%', left: '24.4%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      nameCoTenant: {
        translations: { en: 'Name', po: '', jp: '' },
        attributes: { top: '57%', left: '48.4%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
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
        attributes: { top: '57%', left: '77%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
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
        attributes: { top: '57%', left: '86.5%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
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
        attributes: { top: '66.1%', left: '78.5%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      emergencyContact: {
        translations: { en: 'Emergency Contact', po: '', jp: '' },
        attributes: { top: '69.3%', left: '15.6%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      address: {
        translations: { en: 'Address', po: '', jp: '' },
        attributes: { top: '69%', left: '31.8%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      name: {
        translations: { en: 'Name', po: '', jp: '名前' },
        attributes: { top: '70.4%', left: '35.8%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      phone: {
        translations: { en: 'Phone', po: '', jp: '' },
        attributes: { top: '70.4%', left: '58.3%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      relationship: {
        translations: { en: 'Relationship', po: '', jp: '' },
        attributes: { top: '70.4%', left: '82.2%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      guaranteeByGuarantyCompanyHeading: {
        translations: { en: 'Guarantee by Guaranty Company', po: '', jp: '' },
        attributes: { top: '74.8%', left: '55.3%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      guaranteeByGuarantyCompany: {
        translations: { en: 'Guarantee by Guaranty Company', po: '', jp: '' },
        attributes: { top: '84.4%', left: '14.2%', font_size: '10', class_name: 'document-translation', width: '14%' },
        category: 'broker'
      },

      addressGuarantee: {
        translations: { en: 'Address', po: '', jp: '' },
        attributes: { top: '79.5%', left: '30.9%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      nameGuarantee: {
        translations: { en: 'Name', po: '', jp: '' },
        attributes: { top: '84.5%', left: '31%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      phoneGuarantee: {
        translations: { en: 'Phone', po: '', jp: '' },
        attributes: { top: '83.4%', left: '63.1%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      registrationGuarantee: {
        translations: { en: 'Registration No.', po: '', jp: '' },
        attributes: { top: '88.9%', left: '31%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      ministersRegistrationGuarantee: {
        translations: { en: 'Land & Transportation Minister', po: '', jp: '' },
        attributes: { top: '88.9%', left: '55.7%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },
    # },
    # 12 => {
      signedAndSealed: {
        translations: { en: 'To be signed and sealed below', po: '', jp: '' },
        attributes: { top: '8.8%', left: '22.7%', font_size: '10', class_name: 'document-translation', font_weight: 'bold' },
        category: 'broker'
      },

      inWitnessWhereOf: {
        translations: { en: 'IN WITNESS WHEREOF, the following Landlord and the Tenant have signed and affixed their seals to the Contract in duplicate, each party retaining one sealed copy.', po: '', jp: '' },
        attributes: { top: '15.8%', left: '16.3%', font_size: '10', class_name: 'document-translation', width: '76.5%' },
        category: 'document'
      },

      year: {
        translations: { en: 'Year', po: '', jp: '' },
        attributes: { top: '20.8%', left: '27.7%', font_size: '10', class_name: 'document-translation' },
        category: 'document'
      },

      month: {
        translations: { en: 'Month', po: '', jp: '' },
        attributes: { top: '20.8%', left: '37.3%', font_size: '10', class_name: 'document-translation' },
        category: 'document'
      },

      day: {
        translations: { en: 'Day', po: '', jp: '' },
        attributes: { top: '20.8%', left: '47.3%', font_size: '10', class_name: 'document-translation' },
        category: 'document'
      },

      landlord: {
        translations: { en: 'Landlord', po: '', jp: '' },
        attributes: { top: '25%', left: '14.5%', font_size: '10', class_name: 'document-translation' },
        category: 'landlord'
      },

      addressLandlord: {
        translations: { en: 'Address', po: '', jp: '' },
        attributes: { top: '25.5%', left: '26.7%', font_size: '10', class_name: 'document-translation' },
        category: 'landlord'
      },

      nameLandlord: {
        translations: { en: 'Name', po: '', jp: '' },
        attributes: { top: '30%', left: '26.7%', font_size: '10', class_name: 'document-translation' },
        category: 'landlord'
      },

      phoneLandlord: {
        translations: { en: 'Phone', po: '', jp: '' },
        attributes: { top: '34%', left: '26.7%', font_size: '10', class_name: 'document-translation' },
        category: 'landlord'
      },

      sealLandlord: {
        translations: { en: 'Seal', po: '', jp: '' },
        attributes: { top: '31.2%', left: '82%', font_size: '10', class_name: 'document-translation' },
        category: 'landlord'
      },

      tenant1: {
        translations: { en: 'Tenant', po: '', jp: '' },
        attributes: { top: '38.5%', left: '14.5%', font_size: '10', class_name: 'document-translation' }
      },

      addressTenant: {
        translations: { en: 'Address', po: '', jp: '' },
        attributes: { top: '38.5%', left: '26.7%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
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
        attributes: { top: '45%', left: '82%', font_size: '10', class_name: 'document-translation' },
        category: 'tenant'
      },

      intermediary: {
        translations: { en: 'Intermediary', po: '', jp: '' },
        attributes: { top: '56%', left: '14.5%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      broker: {
        translations: { en: 'Broker', po: '', jp: '' },
        attributes: { top: '60.5%', left: '14.5%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      brokerRegistrationJurisdiction: {
        translations: { en: 'Broker Registration Jurisdiction', po: '', jp: '' },
        attributes: nil,
        category: 'broker'
      },

      brokerRegistrationGrantor: {
        translations: { en: 'Broker Registration Grantor', po: '', jp: '' },
        attributes: nil,
        category: 'broker'
      },

      agent: {
        translations: { en: 'Agent', po: '', jp: '' },
        attributes: { top: '64%', left: '14.5%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      license: {
        translations: { en: 'License No.', po: '', jp: '' },
        attributes: { top: '56%', left: '27%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      licenseNoFirst: {
        translations: { en: 'License No. (first No.)', po: '', jp: '' },
        attributes: nil,
        category: 'broker'
      },

      governor: {
        translations: { en: 'Governor', po: '', jp: '' },
        attributes: { top: '56%', left: '47%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      minister: {
        translations: { en: 'Minister', po: '', jp: '' },
        attributes: { top: '56%', left: '55%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      brokerAddress: {
        translations: { en: 'Address', po: '', jp: '' },
        attributes: { top: '64.5%', left: '27%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      brokerCompanyName: {
        translations: { en: 'Company Name', po: '', jp: '' },
        attributes: { top: '69%', left: '27%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      brokerRepresentative: {
        translations: { en: 'Representative', po: '', jp: '' },
        attributes: { top: '73.3%', left: '27%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      sealBrokerCompany: {
        translations: { en: 'Seal', po: '', jp: '' },
        attributes: { top: '73.3%', left: '65.5%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      registeredBroker: {
        translations: { en: 'Registered Real Estate Broker', po: '', jp: '' },
        attributes: { top: '77.3%', left: '27%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      licenseNumber: {
        translations: { en: 'License No.', po: '', jp: '' },
        attributes: { top: '77.3%', left: '48.9%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      brokerStaffRegJurisdiction: {
        translations: { en: 'Registration Jurisdiction', po: '', jp: '' },
        attributes: nil,
        category: 'broker'
      },

      governorBroker: {
        translations: { en: 'Governor', po: '', jp: '' },
        attributes: { top: '77.3%', left: '71.2%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      nameBroker: {
        translations: { en: 'Name', po: '', jp: '' },
        attributes: { top: '82.4%', left: '48.9%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      sealBroker: {
        translations: { en: 'Seal', po: '', jp: '' },
        attributes: { top: '82.4%', left: '87%', font_size: '10', class_name: 'document-translation' },
        category: 'broker'
      },

      amenities: {
        translations: { en: 'Amenities', po: '', jp: '設備' },
        attributes: nil,
        category: 'amenity'
      }
  # }
}
    # object = fixed_term_rental
  #   return object
  # end
end

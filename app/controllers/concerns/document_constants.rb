#!!!! IMORTANT: Need to get constants: Building, Amenities etc for selectChoices
module DocumentConstants
  # CONSTANT for fetch_translation and save and create agreement in booking
  # def important_points_explanation_translation
    # include ImportantPointsExplanationTranslation
    INCLUDED_CHOICES = {
      0 => { value: false, en: 'Not included', jp: '込まれない', type: 'boolean', className: 'form-rectangle' },
      1 => { value: true, en: 'Included', jp: '込み', type: 'boolean', className: 'form-rectangle' }
    };

    AmenitiesChoices = {
      0 => { value: 1, en: 'Yes', jp: '有り', type: 'boolean', className: 'form-rectangle' },
      1 => { value: 0, en: 'No', jp: '無し', type: 'boolean', className: 'form-rectangle' }
    };

    AMENITIES =
    {
      lockbox: {
      name: 'lockbox',
      en: 'Lock box',
      jp: '金庫',
      choices: AmenitiesChoices,
    },

    auto_lock: {
      name: 'auto_lock',
      en: 'Auto Lock',
      jp: 'オートロック',
      choices: AmenitiesChoices,
    },

    security_system: {
      name: 'security_system',
      en: 'Security System',
      jp: '防犯システム',
      choices: AmenitiesChoices,
    },

    lock_key: {
      name: 'lock_key',
      en: 'Door Lock',
      jp: '鍵' },

    fire_extinguisher: {
      name: 'fire_extinguisher',
      en: 'Fire Extinguisher',
      jp: '消火器',
      choices: AmenitiesChoices,
    },

    mail_box: {
      name: 'mail_box',
      en: 'Mail Box',
      jp: '郵便箱',
      choices: AmenitiesChoices,
    },

    parcel_delivery_box: {
      name: 'parcel_delivery_box',
      en: 'Parcel Box',
      jp: '宅配ボックス',
      choices: AmenitiesChoices,
    },

    parking: {
      name: 'parking',
      en: 'Parking',
      jp: '駐車場',
      choices: AmenitiesChoices,
    },

    ac: {
      name: 'ac',
      en: 'A/C',
      jp: 'エアコン',
      choices: AmenitiesChoices,
    },

    heater: {
      name: 'heater',
      en: 'Heater',
      jp: 'ヒーター',
      choices: AmenitiesChoices,
    },

    lighting_fixed: {
      name: 'lighting_fixed',
      en: 'Fixed Lighting',
      jp: '備付け照明器具',
      choices: AmenitiesChoices,
    },

    wifi: {
      name: 'wifi',
      en: 'Wifi',
      jp: 'Wifi',
      choices: AmenitiesChoices,
    },

    pocket_wifi: {
      name: 'pocket_wifi',
      en: 'Pocket Wifi',
      jp: 'ポケットWifi',
      choices: AmenitiesChoices,
    },

    internet_ready: {
      name: 'internet_ready',
      en: 'Internet Ready',
      jp: 'インターネット対応',
      choices: AmenitiesChoices,
    },

    wheelchair_accessible: {
      name: 'wheelchair_accessible',
      en: 'Wheelchair Accessible',
      jp: '車椅子アクセス',
      choices: AmenitiesChoices,
    },

    bath_essentials: {
      name: 'bath_essentials',
      en: 'Bath Essentials',
      jp: '洗面用具',
      choices: AmenitiesChoices,
    },

    hot_water: {
      name: 'hot_water',
      en: 'Hot Water',
      jp: '湯沸かし器',
      choices: AmenitiesChoices,
    },

    hairdryer: {
      name: 'hairdryer',
      en: 'Hair Dryer',
      jp: 'ヘアドライヤー',
      choices: AmenitiesChoices,
    },

    bath_tub: {
      name: 'bath_tub',
      en: 'Bath Tub',
      jp: '湯船',
      choices: AmenitiesChoices,
    },

    shower: {
      name: 'shower',
      en: 'Shower',
      jp: 'シャワー',
      choices: AmenitiesChoices,
    },

    wash_basin: {
      name: 'wash_basin',
      en: 'Wash Basin',
      jp: '洗面台',
      choices: AmenitiesChoices,
    },

    washlet: {
      name: 'washlet',
      en: 'Washlet',
      jp: 'ウォッシュレット',
      choices: AmenitiesChoices,
    },

    tv: {
      name: 'tv',
      en: 'TV',
      jp: 'テレビ',
      choices: AmenitiesChoices,
    },

    cable_tv: {
      name: 'cable_tv',
      en: 'Digital/CATV Ready',
      jp: 'ディジタル・CATV 対応',
      choices: AmenitiesChoices,
    },

    dvd_player: {
      name: 'dvd_player',
      en: 'DVD Player',
      jp: 'DVDプレーヤー',
      choices: AmenitiesChoices,
    },

    sofa: {
      name: 'sofa',
      en: 'Sofa',
      jp: 'ソファー',
      choices: AmenitiesChoices,
    },

    crib: {
      name: 'crib',
      en: 'Crib',
      jp: 'ベビーベッド',
      choices: AmenitiesChoices,
    },

    high_chair: {
      name: 'high_chair',
      en: 'High Chair',
      jp: 'ハイチェア',
      choices: AmenitiesChoices,
    },

    kitchen: {
      name: 'kitchen',
      en: 'Kitchen',
      jp: 'キッチン',
      choices: AmenitiesChoices,
    },

    kitchen_grill: {
      name: 'kitchen_grill',
      en: 'Kitchen Stove',
      jp: 'ガス・電気調理器',
      choices: AmenitiesChoices,
    },

    oven: {
      name: 'oven',
      en: 'Oven',
      jp: 'オーブン',
      choices: AmenitiesChoices,
    },

    cooking_basics: {
      name: 'cooking_basics',
      en: 'Cooking Basics',
      jp: 'クッキング用具',
      choices: AmenitiesChoices,
    },

    eating_utensils: {
      name: 'eating_utensils',
      en: 'Eating Utensils',
      jp: '食器',
      choices: AmenitiesChoices,
    },

    microwave: {
      name: 'microwave',
      en: 'Microwave',
      jp: '電子レンジ',
      choices: AmenitiesChoices,
    },

    refrigerator: {
      name: 'refrigerator',
      en: 'Refrigerator',
      jp: '冷蔵庫',
      choices: AmenitiesChoices,
    },

    dish_washer: {
      name: 'dish_washer',
      en: 'Dish Washer',
      jp: '皿洗い機',
      choices: AmenitiesChoices,
    },

    dining_table: {
      name: 'dining_table',
      en: 'Dining Table',
      jp: 'テーブル',
      choices: AmenitiesChoices,
    },

    washer: {
      name: 'washer',
      en: 'Washer',
      jp: '洗濯機',
      choices: AmenitiesChoices,
    },

    washer_dryer_area: {
      name: 'washer_dryer_area',
      en: 'Washer Dryer Area',
      jp: '洗濯機置き場',
      choices: AmenitiesChoices,
    },

    dryer: {
      name: 'dryer',
      en: 'Dryer',
      jp: 'ドライヤー',
      choices: AmenitiesChoices,
    },

    iron: {
      name: 'iron',
      en: 'Iron',
      jp: 'アイロン',
      choices: AmenitiesChoices,
    }
  };

  BUILDING = {
    language_code: {
      name: 'language_code',
      en: 'Language',
      jp: '言語',
      component: 'FormChoices',
      type: 'string',
      choices: {
        :en => { value: 'en', en: '🇬🇧 English', jp: '🇬🇧 English', type: 'button', className: 'form-rectangle' },
        :jp => { value: 'jp', en: '🇯🇵 Japanese', jp: '🇯🇵 日本語', type: 'button', className: 'form-rectangle' },
        :po => { value: 'po', en: '🇵🇹 Portuguese', jp: '🇵🇹 Português', type: 'button', className: 'form-rectangle' },
        # 2 => { value: 'Wooden Structure', en: 'Wooden Structure', jp: '木造', type: 'button', className: 'form-rectangle' },
        # 2 => { value: '', type: 'string', component: 'input', className: 'form-rectangle form-input' }
      },
      # for rendering when fields are language indepedent.
      # ie needs to inputted in new language in create contractor modal
      # language_independent: true,
      # for rendering in forms only choices that do not exist
      limit_choices: true,
      # map to column in backend database
      map_to_record: 'language_code'
    },

    name: {
      name: 'name',
      en: 'Building Name',
      jp: '名称',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },

    address1: {
      name: 'address1',
      en: 'Street Address',
      jp: '町村番地',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },
    # address2: { en: 'Street Address2', jp: '' },
    city: {
      name: 'city',
      en: 'City',
      jp: '市区',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },

    state: {
      name: 'state',
      en: 'State',
      jp: '都道府県',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },

    zip: {
      name: 'zip',
      en: 'Zip',
      jp: '郵便番号',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },

    country: {
      name: 'country',
      en: 'Country',
      jp: '国',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },

    units: {
      name: 'units',
      en: 'Units',
      jp: '戸数',
      component: 'input',
      type: 'string',
      className: 'form-control',
      language_independent: true,
    },

    year_built: {
      name: 'year_built',
      en: 'Year Built',
      jp: '工事完了年',
      component: 'input',
      type: 'string',
      className: 'form-control',
      language_independent: true,
    },

    last_renovation_year: {
      name: 'last_renovation_year',
      en: 'Last Renovation Year',
      jp: '大規模修繕工事の実施年',
      component: 'input',
      type: 'string',
      className: 'form-control',
      language_independent: true,
    },

    floors: {
      name: 'floors',
      en: 'Floors',
      jp: '階建',
      component: 'input',
      type: 'string',
      className: 'form-control',
      language_independent: true,
    },

    floors_underground: {
      name: 'floors_underground',
      en: 'Floors Underground',
      jp: '地下階数',
      component: 'input',
      type: 'string',
      className: 'form-control',
      language_independent: true,
    },

    construction: {
      name: 'construction',
      en: 'Building Construction',
      jp: '構造',
      component: 'FormChoices',
      type: 'string',
      choices: {
        :rc => { value: 'rc', height: '2.0%', width: '10%', en: 'RC (Reinforced Concrete)', jp: 'RC (鉄筋コンクリート)', type: 'button', className: 'form-rectangle' },
        :src => { value: 'src', height: '2.0%', width: '10%', en: 'SRC (Steel Reinforced Concrete)', jp: 'SRC (鉄骨鉄筋コンクリート)', type: 'button', className: 'form-rectangle' },
        :cft => { value: 'cft', height: '2.0%', width: '10%', en: 'CFT (Concrete Filled Steel Tube)', jp: 'CFT (コンクリート充填鋼管)', type: 'button', className: 'form-rectangle' },
        :s => { value: 's', height: '2.0%', width: '10%', en: 'S (Steel Frame)', jp: 'S (軽量鉄骨造)', type: 'button', className: 'form-rectangle' },
        :aluminum => { value: 'aluminum', height: '2.0%', width: '10%', en: 'AL (Alminium)', jp: 'AL (アルミ)', type: 'button', className: 'form-rectangle' },
        :wooden => { value: 'wooden', height: '2.0%', width: '10%', en: 'W (Wooden)', jp: 'W (木造)', type: 'button', className: 'form-rectangle' },
        # 5 => { value: 'Other', en: 'Other', jp: 'その他', type: 'button', className: 'form-rectangle' },
        # 4 => { value: '', type: 'string', component: 'input', className: 'form-rectangle form-input' }
      },
    },

    building_type: {
      name: 'building_type',
      en: 'Building Type',
      jp: '種類',
      component: 'FormChoices',
      type: 'string',
      choices: {
        :flatInBuilding => { value: 'flatInBuilding', en: 'Multi Family', jp: '共同建', type: 'button', className: 'form-rectangle' },
        :townHouse => { value: 'townHouse', en: 'Townhouse', jp: '長屋建', type: 'button', className: 'form-rectangle' },
        :singleFamily => { value: 'singleFamily', en: 'Single Family', jp: '一戸建', type: 'button', className: 'form-rectangle' },
        :other => { value: 'other', en: 'Other', jp: 'その他', type: 'button', className: 'form-rectangle' }
      },
      language_independent: true,
    },

    building_management_company: {
      name: 'building_management_company',
      en: 'Building Management Company',
      jp: '管理会社名',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },

    building_management_contact: {
      name: 'building_management_contact',
      en: 'Building Management Contact',
      jp: '管理会社　担当者名',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },

    building_management_address: {
      name: 'building_management_address',
      en: 'Building Management Contact',
      jp: '管理会社　住所',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },

    building_management_phone: {
      name: 'building_management_phone',
      en: 'Building Management Phone',
      jp: '管理会社　電話',
      component: 'input',
      type: 'string',
      className: 'form-control',
      language_independent: true,
    },

    power_usage_amount: {
      name: 'power_usage_amount',
      en: 'Power Usage Amount',
      jp: '使用可能電気容量',
      component: 'input',
      type: 'string',
      className: 'form-control',
      language_independent: true,
    },

    electricity: {
      name: 'electricity',
      en: 'Electric Company',
      jp: '電気会社',
      component: 'input',
      type: 'string',
      className: 'form-control',
      # language_independent: true,
    },

    sewage: {
      name: 'sewage',
      en: 'Sewage',
      jp: '下水道',
      component: 'FormChoices',
      type: 'string',
      choices: {
        :publicSewer => { value: 'publicSewer', en: 'Public Sewer', jp: '公共下水道', type: 'button', className: 'form-rectangle' },
        :septicTank => { value: 'septicTank', en: 'Septic Tank', jp: '浄化槽', type: 'button', className: 'form-rectangle' },
        :none => { value: 'none', en: 'None', jp: '無し', type: 'button', component: 'button', className: 'form-rectangle' }
      },
      language_independent: true,
    },

    water: {
      name: 'water',
      en: 'Water',
      jp: '上水道',
      component: 'FormChoices',
      type: 'string',
      choices: {
        :publicWater => { value: 'publicWater', en: 'Public Water', jp: '水道本管より直結', type: 'button', className: 'form-rectangle' },
        # 1 => { value: 'Private Water', en: 'Private Water', jp: '市営水道', type: 'button', className: 'form-rectangle' },
        :waterTank => { value: 'waterTank', en: 'Water Tank', jp: '受水槽', type: 'button', className: 'form-rectangle' },
        :well => { value: 'well', en: 'Well', jp: '井戸', type: 'button', className: 'form-rectangle' },
        :none => { value: 'none', en: 'None', jp: '無し', type: 'button', component: 'button', className: 'form-rectangle' }
      },
      language_independent: true,
    },

    gas: {
      name: 'gas',
      en: 'Gas',
      jp: 'ガス',
      component: 'FormChoices',
      type: 'string',
      choices: {
        :publicGas => { value: 'publicGas', en: 'Public Gas', jp: '都市ガス', type: 'button', className: 'form-rectangle' },
        :propaneGas => { value: 'propaneGas', en: 'Propane Gas', jp: 'プロパンガス', type: 'button', className: 'form-rectangle' },
        :none => { value: 'none', en: 'None', jp: '無し', type: 'button', component: 'button', className: 'form-rectangle' }
      },
      language_independent: true,
    },

    asbestos_record: {
      name: 'asbestos_record',
      en: 'Asbestos Record',
      jp: 'アスベストス',
      component: 'FormChoices',
      type: 'boolean',
      choices: {
        0 => { value: 'true', en: 'Yes, performed', jp: 'はい、調査済み', type: 'button', className: 'form-rectangle' },
        1 => { value: 'false', en: 'No, not performed', jp: 'いいえ、調査されてません', type: 'button', className: 'form-rectangle' }
      },
      language_independent: true,
    },

    asbestos_survey_contents: {
      name: 'asbestos_survey_contents',
      en: 'Asbestos Survey Contents',
      jp: 'アスベストス調査の内容',
      component: 'input',
      type: 'string',
      className: 'form-control',
      # choices: {
        #   0 => { value: '', val: ''},
        # }
      },

    building_owner_name: {
      name: 'building_owner_name',
      en: 'Building Owner Name',
      jp: '物件の所有者名',
      component: 'input',
      type: 'string',
      className: 'form-control',
      # choices: {
      #   0 => { value: '', val: ''},
      # }
    },

    building_owner_address: {
      name: 'building_owner_address',
      en: 'Building Owner Address',
      jp: '物件の所有者の住所',
      component: 'input',
      type: 'string',
      className: 'form-control',
      # choices: {
      #   0 => { value: '', val: ''},
      # }
    },

    building_owner_phone: {
      name: 'building_owner_phone',
      en: 'Building Owner Phone',
      jp: '物件の所有者の電話番号',
      component: 'input',
      type: 'string',
      className: 'form-control',
      language_independent: true,
      # choices: {
      #   0 => { value: '', val: ''},
      # }
    },

    building_inspection_conducted: {
      name: 'building_inspection_conducted',
      en: 'Building Inspection Conducted',
      jp: '建物状況調査の実施の有無',
      component: 'FormChoices',
      type: 'boolean',
      choices: {
        0 => { value: 'true', en: 'Yes, conducted', jp: 'はい、実施済み', type: 'button', className: 'form-rectangle' },
        1 => { value: 'false', en: 'No, not conducted', jp: 'いいえ、実施されてません', type: 'button', className: 'form-rectangle' }
      },
      language_independent: true,
    },

    earthquake_study_contents: {
      name: 'earthquake_study_contents',
      en: 'Earthquake Study Contents',
      jp: '耐震診断の内容',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },

    legal_restrictions: {
      name: 'legal_restrictions',
      en: 'Legal Restrictions (Name)',
      jp: '法令に基づく制限(法令名)',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },

    legal_restrictions_summary: {
      name: 'legal_restrictions_summary',
      en: 'Legal Restrictions (Summary)',
      jp: '法令に基づく制限(概要)',
      component: 'input',
      type: 'string',
      className: 'form-control',
    },

    earthquake_study_performed: {
      name: 'earthquake_study_performed',
      en: 'Earthquake Study Performed',
      jp: '耐震診断の有無',
      component: 'FormChoices',
      type: 'boolean',
      choices: {
        0 => { value: 'true', en: 'Yes, performed', jp: 'はい、有ります', type: 'button', className: 'form-rectangle' },
        1 => { value: 'false', en: 'No, not performed', jp: 'いいえ、有りません', type: 'button', className: 'form-rectangle' }
      },
      language_independent: true,
    },

    inside_disaster_prevention: {
      name: 'inside_disaster_prevention',
      en: 'Inside Disaster Prevention Zone',
      jp: '造成宅地防災区域内か否か',
      component: 'FormChoices',
      type: 'boolean',
      choices: {
        0 => { value: 'true', en: 'Yes, inside', jp: 'はい、内です', type: 'button', className: 'form-rectangle' },
        1 => { value: 'false', en: 'No, outside', jp: 'いいえ、外です', type: 'button', className: 'form-rectangle' }
      },
      language_independent: true,
    },

    inside_disaster_warning: {
      name: 'inside_disaster_warning',
      en: 'Inside Disaster Warning Zone',
      jp: '土砂災害警戒区域内か否か',
      component: 'FormChoices',
      type: 'boolean',
      choices: {
        0 => { value: 'true', en: 'Yes, inside', jp: 'はい、内です', type: 'button', className: 'form-rectangle' },
        1 => { value: 'false', en: 'No, outside', jp: 'いいえ、外です', type: 'button', className: 'form-rectangle' }
      },
      language_independent: true,
    },

    inside_tsunami_warning: {
      name: 'inside_tsunami_warning',
      en: 'Inside Tsunami Warning Zone',
      jp: '津波災害警戒区域内か否か',
      component: 'FormChoices',
      type: 'boolean',
      choices: {
        0 => { value: 'true', en: 'Yes, inside', jp: 'はい、内です', type: 'button', className: 'form-rectangle' },
        1 => { value: 'false', en: 'No, outside', jp: 'いいえ、外です', type: 'button', className: 'form-rectangle' }
      },
      language_independent: true,
    },
  };

  FLAT_FOR_DOCUMENTS = {
    toilet: {
      name: 'toilet',
      en: 'Toilet',
      jp: 'トイレ',
      component: 'DocumentChoices',
      type: 'string',
      choices: {
        # toilet notes
        :dedicatedFlushingToilet => { value: 'dedicatedFlushingToilet', en: 'Dedicated Flushing Toilet', jp: '専用　水洗', type: 'button', className: 'form-rectangle' },
        :dedicatedNonFlushingToilet => { value: 'dedicatedNonFlushingToilet', en: 'Dedicated Non-flushing Toilet', jp: '専用　非水洗', type: 'button', className: 'form-rectangle' },
        :sharedFlushingToilet => { value: 'sharedFlushingToilet', en: 'Shared Flushing Toilet', jp: '共用　水洗', type: 'button', className: 'form-rectangle' },
        :sharedNonFlushingToilet => { value: 'sharedNonFlushingToilet', en: 'Shared Non-flushing Toilet', jp: '共用　非水洗', type: 'button', className: 'form-rectangle' },
        # booleans for use in toilet
        0 => { value: true, en: 'Yes', jp: '有り', type: 'boolean', className: 'form-rectangle' },
        1 => { value: false, en: 'None', jp: '無し', type: 'boolean', className: 'form-rectangle' }
        # 2 => { value: 'Wooden Structure', en: 'Wooden Structure', jp: '木造', type: 'button', className: 'form-rectangle' },
        # 2 => { value: '', type: 'string', component: 'input', className: 'form-rectangle form-input' }
      },
    },

    flat_type: {
      name: 'flat_type',
      en: 'Flat Type',
      jp: '物件の種類',
      component: 'DocumentChoices',
      type: 'string',
      choices: {
        # toilet notes
        :flatInBuilding => { value: 'flatInBuilding', en: 'Flat in Building', jp: '共同住宅', type: 'button', className: 'form-rectangle' },
        :singleFamily => { value: 'singleFamily', en: 'House', jp: '一戸建て', type: 'button', className: 'form-rectangle' },
        :townHouse => { value: 'townHouse', en: 'Town House', jp: '長屋建', type: 'button', className: 'form-rectangle' },
        :others => { value: 'others', en: 'Others', jp: 'その他', type: 'button', className: 'form-rectangle' },
        # # booleans for use in toilet
        # 4 => { value: true, en: 'Yes', jp: '有り', type: 'boolean', className: 'form-rectangle' },
        # 5 => { value: false, en: 'None', jp: '無し', type: 'boolean', className: 'form-rectangle' }
        # 2 => { value: 'Wooden Structure', en: 'Wooden Structure', jp: '木造', type: 'button', className: 'form-rectangle' },
        # 2 => { value: '', type: 'string', component: 'input', className: 'form-rectangle form-input' }
      }

    }
  }

  RENT_PAYMENT = {
    rent_payment_method: {
      name: 'rent_payment_method',
      en: 'Rent Payment Method',
      jp: '家賃の支払い方',
      component: 'FormChoices',
      type: 'string',
      choices: {
        :bank_transfer => { value: 'bank_transfer', en: 'Bank Transfer', jp: '銀行振込', type: 'button', className: 'form-rectangle' },
        :submit_to_owner => { value: 'submit_to_owner', en: 'Submit to Owner', jp: '物件所有者へ持参', type: 'button', className: 'form-rectangle' },
        :submit_to_landlord => { value: 'submit_to_landlord', en: 'Submit to Landlord', jp: '物件貸主へ持参', type: 'button', className: 'form-rectangle' },
        :submit_to_broker => { value: 'submit_to_broker', en: 'Submit to Broker', jp: '物件管理業者へ持参', type: 'button', className: 'form-rectangle' },
        :inputFieldValue => { value: '', en: 'Enter other...', jp: 'その他...', type: 'string', component: 'input', className: 'form-rectangle form-input' }
      }
    },

    transfer_fee_paid_by: {
      name: 'transfer_fee_paid_by',
      en: 'Transfer Fee Paid By',
      jp: '振込手数料負担者',
      component: 'FormChoices',
      type: 'string',
      choices: {
        :tenant => { value: 'tenant', en: 'Tenant', jp: '借主', type: 'button', className: 'form-rectangle' },
        :landlord => { value: 'landlord', en: 'Landlord', jp: '貸主', type: 'button', className: 'form-rectangle' },
      }
    }
};

FACILITY = {
  facility_type: {
    name: 'facility_type',
    en: 'Facility Type',
    jp: '種類',
    component: 'FormChoices',
    type: 'string',
    choices: {
      #documentformMap1 and 2 correspond to the contract document
      #facilityObjectMap corresponds to the column in backend model flat
      :car_parking => { value: 'car_parking', en: 'Car Parking', jp: '駐車場', type: 'button', className: 'form-rectangle', documentFormMap1: 'parking_spaces', documentFormMap2: 'parking_space_number', facilityObjectMap: 'parking_included' },
      :bicycle_parking => { value: 'bicycle_parking', en: 'Bicycle Parking', jp: '駐輪場', type: 'button', className: 'form-rectangle', documentFormMap1: 'bicycle_parking_spaces', documentFormMap2: 'bicycle_parking_space_number', facilityObjectMap: 'bicycle_parking_included' },
      :motorcycle_parking => { value: 'motorcycle_parking', en: 'Motorcycle Parking', jp: 'バイク置場', type: 'button', className: 'form-rectangle', documentFormMap1: 'motorcycle_parking_spaces', documentFormMap2: 'motorcycle_parking_space_number', facilityObjectMap: 'motorcycle_parking_included' },
      :storage => { value: 'storage', en: 'Storage', jp: '物置', type: 'button', className: 'form-rectangle', documentFormMap1: 'storage_spaces', documentFormMap2: 'storage_space_number', facilityObjectMap: 'storage_included' },
      :dedicated_yard => { value: 'dedicated_yard', en: 'Own Yard', jp: '専用庭', type: 'button', className: 'form-rectangle' },
      #5: { value: 'other_facility_name', en: 'Enter other...', jp: 'その他...', type: 'string', component: 'input', className: 'form-rectangle form-input' }
    }
  },

  optional: {
    name: 'optional',
    en: 'Optional?',
    jp: 'オプショナルですか？',
    component: 'FormChoices',
    type: 'string',
    choices: {
      true: { value: 'true', en: 'Yes', jp: 'はい', type: 'button', className: 'form-rectangle' },
      false: { value: 'false', en: 'No', jp: 'いいえ', type: 'button', className: 'form-rectangle' },
    }
  },

  price_per_month: {
    name: 'price_per_month',
    en: 'Price per Month',
    jp: '料金(月)',
    component: 'input',
    type: 'string',
    className: 'form-control'
  },

  facility_number: {
    name: 'facility_number',
    en: 'Facility ID',
    jp: '施設の番号',
    component: 'input',
    type: 'string',
    className: 'form-control'
  },

  facility_deposit: {
    name: 'facility_deposit',
    en: 'Facility Deposit (/month)',
    jp: '施設の敷金(月)',
    component: 'input',
    type: 'string',
    className: 'form-control'
  }
};
    # object = important_points_explanation
  #   return object
  # end
end

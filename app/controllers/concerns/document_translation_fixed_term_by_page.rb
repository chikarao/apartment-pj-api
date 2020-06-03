module DocumentTranslationFixedTermByPage
  # CONTANT for fetch_translation and save and create agreement in booking
  # def fixed_term_rental_contract_translation
    # include FixedTermRentalContractTranslation
    include DocumentTranslationFixedTermAll
    base = DocumentTranslationFixedTermAll::OBJECT
    OBJECT = {
      1 => {
        documentTitle: base[:documentTitle],
        heading: base[:heading],
        rentalInformation: base[:rentalInformation],
        buildingName: base[:buildingName],
        buildingAddress: base[:buildingAddress],
        buildingInformation: base[:buildingInformation],
        buildingType: base[:buildingType],
        apartment: base[:apartment],
        townhouse: base[:townhouse],
        singleFamily: base[:singleFamily],
        other: base[:other],
        construction: base[:construction],
        numberOfUnits: base[:numberOfUnits],
        wooden: base[:wooden],
        nonWood: base[:nonWood],
        unit: base[:unit],
        stories: base[:stories],
        yearBuilt: base[:yearBuilt],
        majorRenovation: base[:majorRenovation],
        completed: base[:completed],
        unitInformation: base[:unitInformation],
        equipment: base[:equipment],
        unitNumber: base[:unitNumber],
        unitNo: base[:unitNo],
        layout: base[:layout],
        oneRoom: base[:oneRoom],
        floorSpace: base[:floorSpace],
        balcony: base[:balcony],
        toilet: base[:toilet],
        toiletAvailability: base[:toiletAvailability],
        yesNoL: base[:yesNoL],
        yesNoR: base[:yesNoR],
        bathTub: base[:bathTub],
        shower: base[:shower],
        washBasin: base[:washBasin],
        washerArea: base[:washerArea],
        waterHeater: base[:waterHeater],
        kitchenStove: base[:kitchenStove],
        parcelBox: base[:parcelBox],
        lock_key: base[:lock_key],
        ac: base[:ac],
        fixedLighting: base[:fixedLighting],
        autoLock: base[:autoLock],
        digitalTv: base[:digitalTv],
        internetReady: base[:internetReady],
        mailBox: base[:mailBox],
        key: base[:key],
        sets: base[:sets],
        electricCapacity: base[:electricCapacity],
        gas: base[:gas],
        water: base[:water],
        sewage: base[:sewage],
        amperes: base[:amperes],
        gasAvailabiity: base[:gasAvailabiity],
        waterAvailability: base[:waterAvailability],
        sewageAvailability: base[:sewageAvailability]
  },
  2 => {
    unitInformation: base[:unitInformation],
    facilities: base[:facilities],
    includedNotIncluded: base[:includedNotIncluded],
    parking: base[:parking],
    bicycleParking: base[:bicycleParking],
    motocycleParking: base[:motocycleParking],
    storage: base[:storage],
    ownYard: base[:ownYard],
    vehicles: base[:vehicles],
    spaceNo: base[:spaceNo],
    vehicles1: base[:vehicles1],
    spaceNo1: base[:spaceNo1],
    vehicles2: base[:vehicles2],
    spaceNo2: base[:spaceNo2],
    contractPeriod: base[:contractPeriod],
    start: base[:start],
    end: base[:end],
    yearFrom: base[:yearFrom],
    monthFrom: base[:monthFrom],
    dayFrom: base[:dayFrom],
    yearTo: base[:yearTo],
    monthTo: base[:monthTo],
    dayTo: base[:dayTo],
    yearsContract: base[:yearsContract],
    monthsContract: base[:monthsContract],
    contractNoticePeriod: base[:contractNoticePeriod],
    noticeYearFrom: base[:noticeYearFrom],
    noticeMonthFrom: base[:noticeMonthFrom],
    noticeDayFrom: base[:noticeDayFrom],
    noticeTo: base[:noticeTo],
    noticeYearTo: base[:noticeYearTo],
    noticeMonthTo: base[:noticeMonthTo],
    noticeDayTo: base[:noticeDayTo],
    rentAndOthers: base[:rentAndOthers],
    rentAndFees: base[:rentAndFees],
    dueDates: base[:dueDates],
    paymentMethod: base[:paymentMethod],
    rent: base[:rent],
    jp: base[:jp],
    rentDueDate: base[:rentDueDate],
    fees: base[:fees],
    jp1: base[:jp1],
    feesDueDate: base[:feesDueDate],
    accountOrInPerson: base[:accountOrInPerson],
    bankName: base[:bankName],
    accountType: base[:accountType],
    accountNumber: base[:accountNumber],
    accountName: base[:accountName],
    transferFeePaidBy: base[:transferFeePaidBy],
    paidInPerson: base[:paidInPerson],
    deposit: base[:deposit],
    rentDepositX: base[:rentDepositX],
    jpDeposit: base[:jpDeposit],
    facilityUsageFee: base[:facilityUsageFee],
    others: base[:others]
  },
  3 => {
    landlordAndManagemement: base[:landlordAndManagemement],
    landlordCompanyAndRepresentative: base[:landlordCompanyAndRepresentative],
    landlordAddress: base[:landlordAddress],
    landlordCompanyName: base[:landlordCompanyName],
    landlordName: base[:landlordName],
    landlordPhone: base[:landlordPhone],
    managementCompanyAndRepresentative: base[:managementCompanyAndRepresentative],
    managementAddress: base[:managementAddress],
    managementCompany: base[:managementCompany],
    managementName: base[:managementName],
    managementPhone: base[:managementPhone],
    registration: base[:registration],
    ministersRegistration: base[:ministersRegistration],
    ifOwnerLandlordDifferent: base[:ifOwnerLandlordDifferent],
    propertyOwner: base[:propertyOwner],
    ownerAddress: base[:ownerAddress],
    ownerCompany: base[:ownerCompany],
    ownertName: base[:ownertName],
    ownerPhone: base[:ownerPhone],
    tenantAndCoTenants: base[:tenantAndCoTenants],
    nameHeading: base[:nameHeading],
    tenant: base[:tenant],
    cotenant: base[:cotenant],
    nameTenant: base[:nameTenant],
    ageTenant: base[:ageTenant],
    yearsTenant: base[:yearsTenant],
    phoneTenant: base[:phoneTenant],
    nameCoTenant: base[:nameCoTenant],
    nameCoTenant1: base[:nameCoTenant1],
    nameCoTenant2: base[:nameCoTenant2],
    ageCoTenant: base[:ageCoTenant],
    ageCoTenant1: base[:ageCoTenant1],
    ageCoTenant2: base[:ageCoTenant2],
    yearsCoTenant: base[:yearsCoTenant],
    yearsCoTenant1: base[:yearsCoTenant1],
    yearsCoTenant2: base[:yearsCoTenant2],
    totalPersons: base[:totalPersons],
    emergencyContact: base[:emergencyContact],
    address: base[:address],
    name: base[:name],
    phone: base[:phone],
    relationship: base[:relationship],
    guaranteeByGuarantyCompanyHeading: base[:guaranteeByGuarantyCompanyHeading],
    guaranteeByGuarantyCompany: base[:guaranteeByGuarantyCompany],
    addressGuarantee: base[:addressGuarantee],
    nameGuarantee: base[:nameGuarantee],
    phoneGuarantee: base[:phoneGuarantee],
    registrationGuarantee: base[:registrationGuarantee],
    ministersRegistrationGuarantee: base[:ministersRegistrationGuarantee]

  },
  12 => {
    signedAndSealed: base[:signedAndSealed],
    inWitnessWhereOf: base[:inWitnessWhereOf],
    year: base[:year],
    month: base[:month],
    day: base[:day],
    landlord: base[:landlord],
    addressLandlord: base[:addressLandlord],
    nameLandlord: base[:nameLandlord],
    phoneLandlord: base[:phoneLandlord],
    sealLandlord: base[:sealLandlord],
    tenant1: base[:tenant1],
    addressTenant: base[:addressTenant],
    nameTenant1: base[:nameTenant1],
    phoneTenant1: base[:phoneTenant1],
    sealTenant: base[:sealTenant],
    intermediary: base[:intermediary],
    broker: base[:broker],
    agent: base[:agent],
    license: base[:license],
    governor: base[:governor],
    minister: base[:minister],
    brokerAddress: base[:brokerAddress],
    brokerCompanyName: base[:brokerCompanyName],
    brokerRepresentative: base[:brokerRepresentative],
    sealBrokerCompany: base[:sealBrokerCompany],
    registeredBroker: base[:registeredBroker],
    licenseNumber: base[:licenseNumber],
    governorBroker: base[:governorBroker],
    nameBroker: base[:nameBroker],
    sealBroker: base[:sealBroker]
  }
}
    # object = fixed_term_rental
  #   return object
  # end
end

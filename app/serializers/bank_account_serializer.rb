class BankAccountSerializer < ActiveModel::Serializer
  attributes :id,
    :account_first_name,
    :account_last_name,
    :account_name,
    :bank_name,
    :branch_name,
    :bank_address,
    :branch_number,
    :account_number,
    :account_type,
    :routing_number,
    :swift,
    :bank_name_english,
    :account_name_english,
    :created_at,
    :updated_at

    belongs_to :user
    has_many :flats
  # !!!!!!add building_type to replace type; does not show up in serialized results
end

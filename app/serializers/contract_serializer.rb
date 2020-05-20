class ContractSerializer < ActiveModel::Serializer
  attributes :id,
    :flat_id,
    :booking_id,
    :contractor_id,
    :work_type,
    :work_sub_type,
    :contract_price,
    :total_price,
    :taxes,
    :fees,
    :adjustments,
    :paid,
    :special_requests,
    :approved,
    :contract_by_ical,
    :contract_by_self,
    :date_from,
    :date_to,
    :contractor,
    :contractor_all_languages,
    :assignments,
    :created_at,
    :updated_at

    # Get contractor all languages
    def contractor_all_languages
      if object.contractor
        contractor_array = [object.contractor]
        other_contractor_languages_array = Contractor.where(base_record_id: object.contractor.id)

        (contractor_array << other_contractor_languages_array).flatten!
      end
      return contractor_array
    end

    # Costom serializer to get assignments to reach staff
    def assignments
      array = []
      # assignment_array = []
      # custom_contract = {}
      custom_assignment = {}
      if !object.assignments.empty?
        object.assignments.each do |each|
          custom_assignment = each.attributes
          # p '!!!!!!!!!!!!!!!!contract_serializer each: ' + each.to_s
          # get the main staff in an array staff_all_languages
          custom_assignment['staff_all_languages'] = [each.staff]
          custom_assignment['staff'] = each.staff
          other_staff = Staff.where(base_record_id: each.staff.id)
          # combine arrays and flatten
          (custom_assignment['staff_all_languages'] << other_staff).flatten!
          array.push(custom_assignment)
        end #end of assignments.each
      end # end of if !object.assignments.empty?
      return array
    end

  # has_many :flats
  # has_many :inspections

  # !!!!!!add building_type to replace type; does not show up in serialized results
end

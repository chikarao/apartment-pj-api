class BuildingSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :address1,
    :address2,
    :city,
    :state,
    :zip,
    :region,
    :country,
    :construction,
    :year_built,
    :last_renovation_year,
    :units,
    :floors,
    :floors_underground,
    :power_usage_amount,
    :electricity,
    :gas,
    :water,
    :sewage,
    :building_management_company,
    :building_management_phone,
    :building_management_contact,
    :building_management_address,
    :building_inspection_conducted,
    :inside_disaster_prevention,
    :inside_disaster_warning,
    :inside_tsunami_warning,
    :asbestos_record,
    :asbestos_survey_contents,
    :earthquake_study_performed,
    :earthquake_study_contents,
    :building_owner_name,
    :building_owner_address,
    :building_owner_phone,
    :inspections,
    :building_languages,
    :language_code,
    :legal_restrictions,
    :legal_restrictions_summary,
    :created_at,
    :updated_at
  # has_many :flats
  # has_many :inspections
    def inspections
      if !object.inspections.empty?
        custom_inspection = nil
        array = []
        # object is a DocumentField instance
        object.inspections.each do |each|
          custom_inspection = each.attributes
          custom_inspection["degradations"] = {
            :foundation => each.foundation,
            :floor_assembly => each.floor_assembly,
            :floor => each.floor,
            :pillars => each.pillars,
            :exterior_walls => each.exterior_walls,
            :balcony => each.balcony,
            :interior_walls => each.interior_walls,
            :ceilings => each.ceilings,
            :roof_truss => each.roof_truss,
            :termite_damage => each.termite_damage,
            :corrosion => each.corrosion,
            :reinforcement => each.reinforcement,
            :concrete_compression => each.concrete_compression,
            :exterior_walls_rain => each.exterior_walls_rain,
            :eaves_rain => each.eaves_rain,
            :balcony_rain => each.balcony_rain,
            :interior_walls_rain => each.interior_walls_rain,
            :ceilings_rain => each.ceilings_rain,
            :roof_truss_rain => each.roof_truss_rain,
            :roof => each.roof,
            :halls => each.halls,
          }
          array.push(custom_inspection)
        end # end of each
      end # end of if !object.inspections.empty?
      return array
    end # end of function

    # def select_choices
    #   # Return hash object of document_field_choices mapped; Nil if no document_field_choices
    #   obj = nil
    #   # Object is a DocumentField instance
    #   p "In document_field_choice serializer in def: " + object.to_s
    #   if !object.select_choices.empty?
    #     obj = {}
    #     # object is a DocumentField instance
    #     object.select_choices.each_with_index do |each,  i|
    #       obj[i] = each
    #     end
    #   end
    #   return obj
    # end # End of function

  # !!!!!!add building_type to replace type; does not show up in serialized results
end

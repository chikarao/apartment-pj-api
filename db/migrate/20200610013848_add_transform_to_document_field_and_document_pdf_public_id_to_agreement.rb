class AddTransformToDocumentFieldAndDocumentPdfPublicIdToAgreement < ActiveRecord::Migration[5.1]
  def change
    add_column :document_fields, :transform, :string, default: nil
    add_column :document_fields, :transform_origin, :string, default: nil
    add_column :agreements, :document_pdf_publicid, :string, default: nil
  end
end

class CreateAgreements < ActiveRecord::Migration[5.1]
  def change
    create_table :agreements do |t|
      t.references :booking, foreign_key: true
      t.references :flat, foreign_key: true
      t.string :document_publicid
      t.string :document_name
      t.boolean :tenant_signed
      t.boolean :owner_signed
      t.boolean :contractor_signed
      t.boolean :sent_to_tenant
      t.boolean :owner_approved
      t.boolean :tenant_approved
      t.boolean :contractor_approved
      t.string :language_code
      t.string :language_code_1
      t.string :template_file_name
      t.string :document_code

      t.timestamps
    end
  end
end

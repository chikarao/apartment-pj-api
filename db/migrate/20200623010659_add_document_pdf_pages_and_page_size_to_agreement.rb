class AddDocumentPdfPagesAndPageSizeToAgreement < ActiveRecord::Migration[5.1]
  def change
    add_column :agreements, :document_pdf_pages, :integer
    add_column :agreements, :document_page_size, :string
    add_column :agreements, :document_pdf_page_size, :string
    add_column :document_inserts, :page_size, :string
  end
end

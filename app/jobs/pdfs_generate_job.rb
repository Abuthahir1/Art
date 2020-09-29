class PdfsGenerateJob < ApplicationJob
  queue_as :default

  def perform(html, folder, file_name,art)
    pdf = WickedPdf.new.pdf_from_string(html)
    file_name = "#{file_name} - #{art.id}"
    save_path = Rails.root.join("public/export/#{folder}","#{file_name}.pdf")
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
    art.pdf.attach(io: File.open("#{save_path}"), filename: "#{file_name}.pdf", content_type: "application/pdf")
    @folder = folder
    @file_name = file_name
  end


end

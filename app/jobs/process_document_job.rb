class ProcessDocumentJob < ActiveJob::Base
  queue_as :default

  def perform(params)
    document = Document.new(params)
     if document.save
       Notification.new_document(document).deliver_now
       puts "Success"
       Document.reindex
     else
      puts "There is an error"
     end
  end
end

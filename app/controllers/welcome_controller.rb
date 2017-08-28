class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @total_documents = Document.all.count
    @last_document = Document.last
    @total_documents_by_user = Document.where(user_id: current_user.id).count
    @last_5_uploaded_documents = Document.order( :id => 'DESC' ).limit(5)
    @top_5_contributors = Document
      .select('user_id, count(*) as total')
      .group('user_id')
      .order('total DESC')
      .limit(5)
    puts @top_5_contributors[0]['total']
        puts @top_5_contributors[1]['total']


  end

  def about
  end
end

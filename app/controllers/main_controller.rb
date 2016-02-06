class MainController < ApplicationController

  layout "application"


  def home
  end

  def our_company

  end

  def gallery

  end

  def contact_us
    @feedback = Feedback.new

  end

  def stack_holders

  end

  def news

  end

  def success

  end

  def search
      if params[:query].present? and params[:query] != ""
        term = params[:query]
        @result = Project.all.where("title LIKE ? OR client_name LIKE ? OR  contract_type LIKE ? OR location LIKE ? OR design_capacity LIKE ? OR construction_man_hour LIKE ? OR project_type LIKE ?","%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%" , "%#{term}%" , "%#{term}%" , "%#{term}%")

        @result2 = News.all.where("title LIKE ? OR caption LIKE ? ","%#{term}%", "%#{term}%")


        @word = term

      else
        redirect_to :back
      end
  end



end

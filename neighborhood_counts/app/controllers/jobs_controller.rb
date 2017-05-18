class JobsController < ApplicationController
  def show
    @hood_search = HoodSearch.find(params['id'])
    render json: { 
      complete: @hood_search.complete?,
      html: render_to_string(
        "/hood_searches/_results",
        :layout => false,
        :locals => { :hood_search => @hood_search }
      )
    }
  end
end
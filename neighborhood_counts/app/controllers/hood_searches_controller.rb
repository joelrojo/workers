class HoodSearchesController < ApplicationController
  def index
    if allowed_params.present?
      @hood_search = HoodSearch.find_or_create_by(allowed_params)
      if !@hood_search.complete?
        TweetWorker.perform_async(@hood_search.id, @hood_search.term)
      end
    end
    if request.xhr?
      render json: { 
        id: @hood_search.id,
        complete: @hood_search.complete?,
        html: render_to_string(
          "/hood_searches/_results",
          :layout => false,
          :locals => { :hood_search => @hood_search }
        )
      }
    end
  end

  private

  def allowed_params
    params[:hood_search].present? && params.require(:hood_search).permit(:term)
  end
end

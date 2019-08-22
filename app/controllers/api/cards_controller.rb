class Api::CardsController < ApiController
  def index
    @query_params = sanitize_query_params
    query = Card.all.ransack(@query_params)
    @cards = query.result.includes(:type, :sources, :packs, npc_sources: [:location, :quest, :rules])
      .order(:patch, :id).limit(params[:limit])
  end

  def show
    @card = Card.find_by(id: params[:id])
    render_not_found unless @card.present?
  end
end

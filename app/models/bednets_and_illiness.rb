class BednetsAndIlliness < ActiveRecord::Base
  attr_accessible :county, :fever_or_malaria, :latitude, :longitude, :under_net
  delegate :params, :h, :link_to, :number_to_currency, to: :@view
  
  geocoded_by :county
  after_validation :geocode, :if => :county_changed?
  
    def initialize(view)
      @view = view
    end

    def as_json(options = {})
      {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: BednetsAndIlliness.count,
        iTotalDisplayRecords: bednets_and_illinesses.total_entries,
        aaData: data
      }
    end

  private

    def data
      bednets_and_illinesses.map do |bednets_and_illiness|
        [
          link_to(bednets_and_illiness.name, bednets_and_illiness),
          h(bednets_and_illiness.county),
          h(bednets_and_illiness.fever_or_malaria),
          h(bednets_and_illiness.under_net)
        ]
      end
    end

    def bednets_and_illinesses
      @bednets_and_illinesses ||= fetch_bednets_and_illinesses
    end

    def fetch_bednets_and_illinesses
      bednets_and_illinesses = BednetsAndIlliness.order("#{sort_column} #{sort_direction}")
      bednets_and_illinesses = bednets_and_illinesses.page(page).per_page(per_page)
      if params[:sSearch].present?
        bednets_and_illinesses = bednets_and_illinesses.where("county ilike :search or fever_or_malaria ilike :search or
         under_net ilike :search",
         search: "%#{params[:sSearch]}%")
      end
      bednets_and_illinesses
    end

    def page
      params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
      params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    end

    def sort_column
      columns = %w[county fever_or_malaria under_net]
      columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
      params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end
end

class HealthFacility < ActiveRecord::Base
  attr_accessible :agency, :district, :division, :facility_type, :hmis, :latitude, :location, :longitude, :name, :province, :srm, :sub_location
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

    def initialize(view)
      @view = view
    end

    def as_json(options = {})
      {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: HealthFacility.count,
        iTotalDisplayRecords: health_facilities.total_entries,
        aaData: data
      }
    end

  private

    def data
      health_facilities.map do |health_facility|
        [
          link_to(health_facility.name, health_facility),
          h(health_facility.province),
          h(health_facility.district),
          h(health_facility.division),
          h(health_facility.location),
          h(health_facility.sub_location),
          h(health_facility.srm),
          h(health_facility.agency)
        ]
      end
    end

    def health_facilities
      @health_facilities ||= fetch_health_facilities
    end

    def fetch_health_facilities
      health_facilities = HealthFacility.order("#{sort_column} #{sort_direction}")
      health_facilities = health_facilities.page(page).per_page(per_page)
      if params[:sSearch].present?
        health_facilities = health_facilities.where("name like :search or location like :search", search: "%#{params[:sSearch]}%")
      end
      health_facilities
    end

    def page
      params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
      params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    end

    def sort_column
      columns = %w[name province district division location sub_location srm agency]
      columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
      params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end
end

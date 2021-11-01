module API
  module V1
    class FlightsController < ApplicationController
      def index
        @flights = FlightsQuery.new(params.permit!.to_h).call

        render json: @flights
      end

      def show
        render json: Flight.find(params[:id])
      end
    end
  end
end

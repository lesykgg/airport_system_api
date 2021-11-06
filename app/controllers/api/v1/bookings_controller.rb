module API
  module V1
    class BookingsController < ApplicationController
      def index
        @bookings = current_user.bookings

        render json: @bookings
      end

      def show
        render json: booking
      end

      def create
        @booking = current_user.bookings.new(booking_params)

        if @booking.save
          render json: @booking, status: :created
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      end

      def update
        if @booking.update(booking_params)
          render json: @booking
        else
          render json: @booking.errors, status: :unprocessable_entity
        end
      end

      def destroy
        booking.destroy
      end

      private

      def booking
        @booking ||= current_user.bookings.find(params[:id])
      end

      def booking_params
        params.require(:booking).permit(:user_id, :flight_id)
      end
    end
  end
end

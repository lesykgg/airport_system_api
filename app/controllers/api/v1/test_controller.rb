module API
  module V1
    class TestController < ApplicationController
      def index
        render json: { a: 1 }
      end
    end
  end
end

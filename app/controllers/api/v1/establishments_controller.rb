module Api
  module V1
    class EstablishmentsController < ApiController
      def index
        establishments
      end

      def show
        establishment
      end

      private

      def establishments
        @establishments ||= Establishment.all
      end

      def establishment
        @establishment ||= Establishment.find(params[:id])
      end
    end
  end
end

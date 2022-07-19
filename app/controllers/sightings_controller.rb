class SightingsController < ApplicationController
    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting.to_json(
                include: {
                    bird: {
                        only: [:name, :species, :id]
                    },
                    location: {
                        only: [:latitude, :longitude, :id]
                    }
                },
                only: [:created_at, :id]
            )
        else
            render json: { message: "No sighting found with that id" }
        end
        
    end

    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end
end

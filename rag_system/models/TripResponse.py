from typing import List, Optional

from pydantic import BaseModel


class POI(BaseModel):
    placeToVisit: str
    costPerPerson: int
    totalTimeToCover: int
    startTime: str
    endTime: str

class ItineraryItem(BaseModel):
    place: str
    planDateTime: str
    poiList: List[POI]

class TrainTicket(BaseModel):
    trainName: Optional[str] = None
    trainNumber: Optional[str] = None
    departureDateTime: str
    arrivalDateTime: str
    price: int
    direction: str  # "outbound" or "return"

class FlightTicket(BaseModel):
    airline: str
    flightNumber: str
    departureDateTime: str
    arrivalDateTime: str
    price: int
    direction: str  # "outbound" or "return"

class TripResponse(BaseModel):
    id: str
    name: str
    description: str
    imagePath: str
    costPerPerson: str
    startDate: str
    endDate: str
    destination: str
    budget: int
    peopleCount: int
    itinerary: List[ItineraryItem]
    outboundFlightTicket: FlightTicket
    outboundTrainTicket: TrainTicket
    returnFlightTicket: FlightTicket
    returnTrainTicket: TrainTicket
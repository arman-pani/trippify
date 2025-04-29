# app/services/irctc_service.py
from models.TripRequest import TripRequest
from models.TripResponse import FlightTicket


def fetch_flight_tickets(request: TripRequest):
    # Mock implementation for fetching flight tickets
    outbound1 = FlightTicket(
        airline="Indigo Airlines",
        flightNumber="AI-123",
        departureDateTime="2025-05-01T15:00:00",
        arrivalDateTime="2025-05-01T22:00:00",
        price=800,
        direction="outbound",
    )
    outbound2 = FlightTicket(
        airline="Air India",
        flightNumber="AI-456",
        departureDateTime="2025-05-01T17:00:00",
        arrivalDateTime="2025-05-01T21:00:00",
        price=750,
        direction="outbound",
    )
    return_trip1 = FlightTicket(
        airline="SpiceJet",
        flightNumber="SG-789",
        departureDateTime="2025-05-10T07:00:00",
        arrivalDateTime="2025-05-10T11:00:00",
        price=900,
        direction="return",
    )
    return_trip2 = FlightTicket(
        airline="Vistara",
        flightNumber="UK-101",
        departureDateTime="2025-05-10T08:00:00",
        arrivalDateTime="2025-05-10T08:00:00",
        price=950,
        direction="return",
    )
    return [outbound1, outbound2], [return_trip1, return_trip2]

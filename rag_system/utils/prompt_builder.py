# app/utils/prompt_builder.py


from datetime import datetime

from models.TripRequest import TripRequest
from models.TripResponse import FlightTicket, TrainTicket


def format_train_ticket(ticket: TrainTicket ) -> dict:
    return {
        "trainName": ticket.trainName,
        "trainNumber": ticket.trainNumber,
        "departureDateTime": ticket.departureDateTime,
        "arrivalDateTime": ticket.arrivalDateTime,
        "price": ticket.price,
        "direction": ticket.direction,
    }

def format_flight_ticket(ticket: FlightTicket) -> dict:
    return {
        "airline": ticket.airline,
        "flightNumber": ticket.flightNumber,
        "departureDateTime": ticket.departureDateTime,
        "arrivalDateTime": ticket.arrivalDateTime,
        "price": ticket.price,
        "direction": ticket.direction,
    }

def build_prompt(request: TripRequest, outbound_trains: list[TrainTicket], return_trains: list[TrainTicket], outbound_flights: list[FlightTicket], return_flights: list[FlightTicket]) -> str:

  outbound_trains = [format_train_ticket(ticket) for ticket in outbound_trains]
  return_trains = [format_train_ticket(ticket) for ticket in return_trains]
  outbound_flights = [format_flight_ticket(ticket) for ticket in outbound_flights]
  return_flights = [format_flight_ticket(ticket) for ticket in return_flights]

  prompt = f"""
You are a travel planner. Based on the following information, plan a trip and return a JSON in the specified format.

User Request:
- Home City: {request.home_city}
- Destination: {request.destination}
- Dates: {request.start_date} to {request.end_date}
- Number of People: {request.people}
- Budget: {request.budget}
- Preferences: {request.description}

Available outbounding Train Options (Before or on Start Date):
{outbound_trains}

Available Returning Train Options (After or on End Date):
{return_trains}

Available outbounding Flight Options (Before or on Start Date):
{outbound_flights}

Available Returning Flight Options (After or on End Date):
{return_flights}

Your Task:
- Create a detailed day-wise itinerary based on destination.
- Suggest one best outbounding train and flight ticket.
- Suggest one best returning train and flight ticket.
- Calculate costPerPerson.
- Generate a name for the trip.
- Select a random imagePath from generic travel images.

Respond ONLY in the following JSON format:

{{
  "id": "string", // random UUID
  "name": "string",
  "description": {request.description},
  "imagePath": "string",
  "costPerPerson": "string",
  "startDate": "{request.start_date}",
  "endDate": "{request.end_date}",
  "destination": "{request.destination}",
  "budget": {request.budget},
  "peopleCount": {request.people},
  "itinerary": [
    {{
      "place": "string",
      "planDateTime": "ISO 8601 DateTime",
      "poiList": [
        {{
          "placeToVisit": "string",
          "costPerPerson": int,
          "totalTimeToCover": int, // in minutes
          "startTime": "HH:MM",
          "endTime": "HH:MM"
        }}
      ]
    }}
  ],
  "outboundFlightTicket": {{
    "airline": "string",
    "flightNumber": "string",
    "departureDateTime": "ISO 8601",
    "arrivalDateTime": "ISO 8601",
    "price": int,
    "direction": "outbound"
  }},
  "outboundTrainTicket": {{
    "trainName": "string",
    "trainNumber": "string",
    "departureDateTime": "ISO 8601",
    "arrivalDateTime": "ISO 8601",
    "price": int,
    "direction": "outbound"
  }},
  "returnFlightTicket": {{
    "airline": "string",
    "flightNumber": "string",
    "departureDateTime": "ISO 8601",
    "arrivalDateTime": "ISO 8601",
    "price": int,
    "direction": "return"
  }},
  "returnTrainTicket": {{
    "trainName": "string",
    "trainNumber": "string",
    "departureDateTime": "ISO 8601",
    "arrivalDateTime": "ISO 8601",
    "price": int,
    "direction": "return"
  }}
}}

Make sure the final JSON is complete and properly filled.
"""
  print(prompt)
  return prompt

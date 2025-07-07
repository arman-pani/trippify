# app/main.py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from models.TripRequest import TripRequest
from models.TripResponse import TripResponse
from services.flight_service import fetch_flight_tickets
from services.gemini_service import generate_trip_plan
from services.irctc_service import fetch_train_tickets, get_train_on

app = FastAPI(title="Travel Planner RAG API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Replace "*" with specific origins if needed
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.post("/plan-trip", response_model=TripResponse)
async def plan_trip(request: TripRequest):
    # Step 1: Get ticket options
    outbound_trains, return_trains = await fetch_train_tickets(request)
    outbound_flights, return_flights = fetch_flight_tickets(request)

    # Step 2: Build prompt for Gemini
    trip_plan = generate_trip_plan(request, outbound_trains, return_trains, outbound_flights, return_flights)

    # Step 3: Return response
    return trip_plan

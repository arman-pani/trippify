# app/services/gemini_service.py

import json

from config import GEMINI_API_KEY
from google import genai
from models.TripRequest import TripRequest
from models.TripResponse import FlightTicket, TrainTicket, TripResponse
from utils.prompt_builder import build_prompt

# Initialize the Gemini client with your API key
client = genai.Client(api_key=GEMINI_API_KEY)

def generate_trip_plan(
    request: TripRequest,
    outbound_trains: list[TrainTicket],
    return_trains: list[TrainTicket],
    outbound_flights: list[FlightTicket],
    return_flights: list[FlightTicket],
) -> TripResponse:
    """
    Generate a detailed trip plan using the Gemini model.
    """

    # Build the prompt using user input and ticket options
    prompt = build_prompt(request, outbound_trains, return_trains, outbound_flights, return_flights)

    try:
        # Generate content using the Gemini model
        response = client.models.generate_content(
            model="gemini-2.0-flash",  # You can choose other available models as needed
            contents=prompt,
            # generation_config={
            #     "temperature": 0.7,
            #     "top_p": 1,
            #     "top_k": 40,
            #     "max_output_tokens": 2048
            # }
        )

        # Extract the JSON from the response's `msg` field
        print(f"Response from Gemini: {response}")  # Debugging line to check the response
        raw_json = response.text.strip("```json").strip("```")  # Assuming the JSON is in the `msg` field
        print(f"Raw JSON from Gemini: {raw_json}")  # Debugging line to check the raw JSON
        try:
            parsed_json = json.loads(raw_json)
        except json.JSONDecodeError as e:
            print(f"Error parsing JSON: {e}")
            raise ValueError("Invalid JSON format in Gemini response")
        return TripResponse(**parsed_json)

    except Exception as e:
        print(f"Error generating trip plan: {e}")
        return TripResponse()

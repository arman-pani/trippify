# app/services/irctc_service.py
from datetime import datetime

import httpx
from fake_useragent import UserAgent
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from models.TripRequest import TripRequest
from models.TripResponse import TrainTicket
from utils.datetime_format import convert_to_iso_datetime
from utils.structure_train_details import Prettify

app = FastAPI()
prettify = Prettify()


async def get_train_on(from_station: str, to_station: str, date: str = None):
    arr = []
    retval = {}
    if date is None:
        retval["success"] = False
        retval["time_stamp"] = datetime.now().timestamp()
        retval["data"] = "Please Add Specific Date"
        return retval

    url = f"https://erail.in/rail/getTrains.aspx?Station_From={from_station}&Station_To={to_station}&DataSource=0&Language=0&Cache=true"
    try:
        user_agent = UserAgent().random
        async with httpx.AsyncClient() as client:
            response = await client.get(url, headers={"User-Agent": user_agent})
            data = response.text
        json_data = prettify.between_station(data)
        if not json_data.get("success"):
            return json_data

        DD, MM, YYYY = map(int, date.split("-"))
        day_index = prettify.get_day_on_date(DD, MM, YYYY)
        for ele in json_data["data"]:
            if ele["train_base"]["running_days"][day_index] == "1":
                arr.append(ele)

        retval["success"] = True
        retval["time_stamp"] = datetime.now().timestamp()
        retval["data"] = arr

        return retval

    except Exception as e:
        print(str(e))
        return {"success": False, "error": str(e)} 

async def fetch_train_tickets(request: TripRequest):
    # Mock implementation for fetching train tickets

  
    destination = request.destination
    home_city = request.home_city

    #Onbounding Train Ticket
    onbounding_train_details = await get_train_on(
        from_station=home_city,
        to_station=destination,
        date=request.start_date
    )

    onbounding_trains = []
    print(onbounding_train_details)

    for train in onbounding_train_details["data"]:
        print(train)
        fromTime = train["train_base"]["from_time"]
        toTime = train["train_base"]["to_time"]
        travelTime = train["train_base"]["travel_time"]
        
        departureDateTime, arrivalDateTime = convert_to_iso_datetime(
            start_date=request.start_date,
            from_time=fromTime,
            to_time=toTime,
            travel_time=travelTime
        )

        # Assuming TrainTicket is a model or data structure to store train details
        train_ticket = TrainTicket(
            trainName=train["train_base"]["train_name"],
            trainNumber=train["train_base"]["train_no"],
            departureDateTime= departureDateTime,
            arrivalDateTime= arrivalDateTime,
            price=1000,
            direction="outbound"
        )

        onbounding_trains.append(train_ticket)

    # Return Train Ticket
    return_train_details = await get_train_on(
        from_station=destination,
        to_station=home_city,
        date=request.end_date
    )

    return_trains = []
    for train in return_train_details["data"]:
        fromTime = train["train_base"]["from_time"]
        toTime = train["train_base"]["to_time"]
        travelTime = train["train_base"]["travel_time"]

        departureDateTime, arrivalDateTime = convert_to_iso_datetime(
            start_date=request.end_date,
            from_time=fromTime,
            to_time=toTime,
            travel_time=travelTime
        )

        # Assuming TrainTicket is a model or data structure to store train details
        train_ticket = TrainTicket(
            trainName=train["train_base"]["train_name"],
            trainNumber=train["train_base"]["train_no"],
            departureDateTime= departureDateTime,
            arrivalDateTime= arrivalDateTime,
            price=1000,
            direction="return"
        )

        return_trains.append(train_ticket)

    print("Onbounding Trains: ", onbounding_trains)
    print("Return Trains: ", return_trains)
    return onbounding_trains, return_trains
    
     

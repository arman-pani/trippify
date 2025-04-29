from datetime import datetime, timedelta


def convert_to_iso_datetime(start_date: str, from_time: str, to_time: str, travel_time: str) -> tuple:
    """
    Converts from_time and to_time to ISO 8601 DateTime format.

    Args:
        start_date (str): The start date in "YYYY-MM-DD" format.
        from_time (str): The departure time in "HH:MM" format.
        to_time (str): The arrival time in "HH:MM" format.
        travel_time (str): The travel time in "HH:MM" format.

    Returns:
        tuple: A tuple containing ISO 8601 formatted departure and arrival DateTime strings.


    """

    from_time = from_time.replace('.', ':')
    to_time = to_time.replace('.', ':')

    # Parse start_date and times
    from_time_obj = datetime.strptime(from_time, "%H:%M").time()
    to_time_obj = datetime.strptime(to_time, "%H:%M").time()
    start_date_obj = datetime.strptime(start_date, "%d-%m-%Y").date()

    # Combine start_date with from_time
    departure_datetime = datetime.combine(start_date_obj, from_time_obj)

    # Calculate arrival_datetime
    travel_hours, travel_minutes = map(int, travel_time.split('.'))
    travel_duration = timedelta(hours=travel_hours, minutes=travel_minutes)
    arrival_datetime = departure_datetime + travel_duration

    # Check if arrival_datetime's time matches to_time
    if arrival_datetime.time() != to_time_obj:
        # If not, adjust arrival_datetime to match to_time
        arrival_datetime = datetime.combine(
            departure_datetime.date() + timedelta(days=1), to_time_obj
        )

    # Return ISO 8601 formatted strings
    return departure_datetime.isoformat(), arrival_datetime.isoformat()
from pydantic import BaseModel
from typing import List, Optional

class TripRequest(BaseModel):
    home_city: str
    destination: str
    start_date: str
    end_date: str
    people: int
    budget: Optional[int] = None
    description: Optional[str] = None

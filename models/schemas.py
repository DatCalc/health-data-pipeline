from pydantic import BaseModel

class VitalInput(BaseModel):
    user_id: str
    bpm: int

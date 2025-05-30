from fastapi import APIRouter

router = APIRouter()

@router.get("/users")
def list_users():
    return [{"user_id": 1}, {"user_id": 2}]

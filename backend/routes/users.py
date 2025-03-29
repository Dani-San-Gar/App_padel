from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import SessionLocal
from models import User
from schemas import UserCreate

router = APIRouter()

# Conexión a la base de datos
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/register/")
def register_user(user: UserCreate, db: Session = Depends(get_db)):
    existing_user = db.query(User).filter(User.email == user.email).first()
    if existing_user:
        raise HTTPException(status_code=400, detail="El usuario ya existe")

    new_user = User(
        nombre=user.nombre,
        apellidos=user.apellidos,
        email=user.email,
        contraseña=user.contraseña,  # Recuerda hashear la contraseña
        telefono=user.telefono
    )

    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return {"message": "Usuario registrado con éxito"}

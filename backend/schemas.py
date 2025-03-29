from pydantic import BaseModel

class UserCreate(BaseModel):
    nombre: str
    apellidos: str
    email: str
    contraseña: str
    telefono: str

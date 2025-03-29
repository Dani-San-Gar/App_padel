from fastapi import FastAPI
from database import engine, Base
from routes import users

app = FastAPI()

# Crear las tablas en la base de datos
Base.metadata.create_all(bind=engine)

# Incluir las rutas
app.include_router(users.router, prefix="/api", tags=["users"])

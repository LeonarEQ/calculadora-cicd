# Imagen base de Python
FROM python:3.9-slim

# Directorio contenedor
WORKDIR /app

# Copiar archivos al contenedor
COPY requirements.txt /app/
COPY . /app/

# Actualizar pip
RUN pip install --upgrade pip

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Instalar Ruff 
RUN pip install ruff

# Establecer el directorio raíz en PYTHONPATH para los tests
ENV PYTHONPATH=/app

# Puerto 8000
EXPOSE 8000

# Ejecutar aplicación
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

FROM python:3.12-slim

#crea usuario no root para que un atacante no tenga control total si el proceso falla.
RUN useradd -m appuser

WORKDIR /app

#copia dependencias primero para aprovechar cache de docker y no volver a descargar dependencias cuando no es necesario
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

#copia el resto del codigo
COPY . .

#activa usuario sin privilegios
USER appuser

#puerto de escucha del backend
EXPOSE 5000

#healthcheck (con valores default de docker) apunta al endpoint /api/health definido en app.py.
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
	CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/api/health')" || exit 1

#gunicorn como servidor de produccion
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
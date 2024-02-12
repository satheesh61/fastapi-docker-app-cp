from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health():
    # Define the response JSON object
    response = {
        "result": "Healthy",
        "error": False
    }
    # Return the response
    return response


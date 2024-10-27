# pip install requests
import requests
from openai import OpenAI
url = "https://api.lemonfox.ai/v1/audio/transcriptions"
headers = {
  "Authorization": "6l8R7VFEawJdoaOAcDoPQ845gtOhjBIR"
}
data = {
  "file": "https://output.lemonfox.ai/wikipedia_ai.mp3",
  "language": "english",
  "response_format": "text"
}

response = requests.post(url, headers=headers, data=data)
print(response.text())

# To upload a local file add the files parameter:
# files = {"file": open("/path/to/audio.mp3", "rb")}
# response = requests.post(url, headers=headers, files=files, data=data)

# pip install --upgrade openai


client = OpenAI(
  api_key="6l8R7VFEawJdoaOAcDoPQ845gtOhjBIR",
  base_url="https://api.lemonfox.ai/v1",
)

completion = client.chat.completions.create(
  messages=[
    { "role": "system", "content": "You are a helpful assistant." },
    { "role": "user", "content": "How many days are in a year?" }
  ],
  model="llama-8b-chat",
)

print(completion.choices[0].message.content)
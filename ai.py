import openai
import speech_recognition as sr


# Set your OpenAI API key here
openai.api_key = 'Paste you api key here'

def ask_openai(question):
    """Function to ask OpenAI's model a question and return the response."""
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",  # You can use any OpenAI model of your choice
        messages=[
            {"role": "user", "content": question}
        ]
    )
    return response['choices'][0]['message']['content']

def listen_to_audio():
    """Function to listen to audio and convert it to text."""
    recognizer = sr.Recognizer()
    with sr.Microphone() as source:
        print("Listening for a question...")
        audio = recognizer.listen(source)
       
        try:
            # Recognizing the audio using Google Web Speech API
            text = recognizer.recognize_google(audio)
            print(f"You asked: {text}")
            return text
        except sr.UnknownValueError:
            print("Sorry, I could not understand the audio.")
            return None
        except sr.RequestError as e:
            print(f"Could not request results from Google Speech Recognition service; {e}")
            return None

def main():
    while True:
        # Get the question from the interviewer
        question = listen_to_audio()
        if question:
            # Get the answer from OpenAI
            answer = ask_openai(question)
            print(f"Answer: {answer}")

if __name__ == "__main__":
    main()

#%%
import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np

x = np.linspace(0, 20, 100)
plt.plot(x, np.sin(x))
plt.show()


#!pip install SpeechRecognition
#!pip install PyAudio

#%%
import speech_recognition

r = speech_recognition.Recognizer()

with speech_recognition.Microphone() as source:
    audio = r.listen(source)
r.recognize_google(audio,language="zh-TW")

#%%
import speech_recognition

r = speech_recognition.Recognizer()

with speech_recognition.Microphone() as source:
    audio = r.listen(source)
r.recognize_google(audio,language="en-US")

import time
import paho.mqtt.client as mqtt
MQTT_SERVER = "localhost"
MQTT_PATH = "Image"


def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))
    client.subscribe(MQTT_PATH)


def on_message(client, userdata, msg):
    name=str(int(time.time()))+'.jpg'
    f = open('/home/pi/PosterPi/'+name, "wb")
    f.write(msg.payload)
    print("Image Received")
    f.close()

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message
client.connect(MQTT_SERVER, 1883, 60)
client.loop_forever()
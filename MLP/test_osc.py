from pythonosc.udp_client import SimpleUDPClient

ip = "127.0.0.1"
port = 9000

client = SimpleUDPClient(ip, port)

client.send_message("/test", "test message")

def main():
    while True:
        try:
            button = input()
            client.send_message("/button", button)
            print("sent", button)
        except KeyboardInterrupt:
            break

main()

#coding: gbk
from socket import *
serverName = 'localhost'
serverPort = 8080
clientSocket = socket(AF_INET,SOCK_DGRAM)
while 1:
	message = raw_input('Input lowercase sentence:')
	if message=="q": break
	clientSocket.sendto(message,(serverName, serverPort))
	modifiedMessage, serverAddress = clientSocket.recvfrom(2048)
	print(modifiedMessage)

clientSocket.close()

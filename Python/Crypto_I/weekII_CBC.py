#coding: utf-8
from Crypto.Cipher import AES
from Crypto import Random
from Crypto.Util import Counter

def strxor(a, b):     # xor two strings of different lengths
    if len(a) > len(b):
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a[:len(b)], b)])
    else:
        return "".join([chr(ord(x) ^ ord(y)) for (x, y) in zip(a, b[:len(a)])])


def get_AES_iv_cypher(CT, pos=32):
	iv = CT[0:pos]
	text = CT[pos:]
	return iv, text
	
def hex2ascii(hex):
	ret =hex.decode('hex')
	'''
	ret = ""
	print "START to parse : " + hex
	
	while 1:
		if hex=="": 
			break
		
		ch = hex[0:2]
		ach = chr(int(ch,16))
		#print ch + " / " + ach
		ret = ret + str( ach )	
		hex = hex[2:]
	'''
	return ret
	
####################################
key_1_CBC = "140b41b22a29beb4061bda66b6747e14"
CT_1_CBC  = "4ca00ff4c898d61e1edbf1800618fb2828a226d160dad07883d04e008a7897ee2e4b7465d5290d0c0e6c6822236e1daafb94ffe0c5da05d9476be028ad7c1d81"
CT_2_CBC  = "5b68629feb8606f9a6667670b75b38a5b4832d0f26e1ab7da33249de7d4afc48e713ac646ace36e872ad5fb8a512428a6e21364b0c374df45503473c5242a253"
'''
Basic CBC mode encryption needs padding.
Our implementation uses rand. IV
'''
####################################
key_2_CTR = "36f18357be4dbd77f050515c73fcf9f2"
CT_1_CTR  = "69dda8455c7dd4254bf353b773304eec0ec7702330098ce7f7520d1cbbb20fc388d1b0adb5054dbd7370849dbf0b88d393f252e764f1f5f7ad97ef79d59ce29f5f51eeca32eabedd9afa9329"
CT_2_CTR  = "770b80259ec33beb2561358a9f2dc617e46218c0a53cbeca695ae45faa8952aa0e311bde9d4e01726d3184c34451"
'''
CTR mode lets you build a stream cipher from a block cipher.
Always avoid the two time pad!
'''
#####################################
'''
iv,cypher = get_AES_iv_cypher(CT_1_CBC)
iv__ = hex2ascii(iv)
key = hex2ascii(key_1_CBC)
cypher__ = hex2ascii(cypher)

obj = AES.new(key, AES.MODE_CBC, iv__)
PT = obj.decrypt(cypher__)
'''
iv,cypher = get_AES_iv_cypher(CT_2_CTR)
iv__ = hex2ascii( iv )
key = hex2ascii(key_2_CTR)
cypher__ = hex2ascii(cypher)

init = int(iv, 16)
print init
ctr = Counter.new(128, initial_value = init)

obj = AES.new(key, mode=AES.MODE_CTR, counter=ctr)
PT = obj.decrypt(cypher__)

print "Answer is : " + PT
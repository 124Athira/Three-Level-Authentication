import pyAesCrypt
import os


def encrypt(fle,fss,password):
    pyAesCrypt.encryptFile(fle,fss,password)

def decrypt(fles,fss,password):
    pyAesCrypt.decryptFile(fles,fss,password)


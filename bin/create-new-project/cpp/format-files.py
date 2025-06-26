import os
import sys
from subprocess import call

clangFormatCall = ['clang-format', '-style=file', '-i']

startDirectory = './'

for path, subdirs, files in os.walk(startDirectory):
    for name in files:
        if name.endswith(('.cpp', '.hpp')):
            filePath = path + os.sep + name
            if os.path.isfile(filePath):
                clangFormatCall.append(filePath)

returnCode = call(clangFormatCall)
sys.exit(returnCode)
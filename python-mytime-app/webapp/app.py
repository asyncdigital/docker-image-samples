import os
import sys
from datetime import datetime, timedelta
from flask import Flask

app = Flask(__name__)

def gettime():
    return str(datetime.utcnow().isoformat())

@app.route('/')
def ok():
    s = gettime()
    sys.stderr.write("STDERR:mytime:{}\n".format(s))
    sys.stdout.write("STDOUT:mytime:{}\n".format(s))
    return s

@app.route('/time')
def curtime():
    s = gettime()
    sys.stderr.write("STDERR:mytime:{}\n".format(s))
    sys.stdout.write("STDOUT:mytime:{}\n".format(s))
    return s

if __name__ == '__main__':
    # Bind to MYVERSION_PORT if defined, otherwise default to 5000.
    port = int(os.environ.get('MYPORT', 5000))
    app.run(host='0.0.0.0', port=port)

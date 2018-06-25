import os
import time
from flask import Flask

app = Flask(__name__)

@app.route('/')
def ok():
    return 'OK'

@app.route('/sleep')
def sleep():
    # Sleep MYSLEEPTIME if defined, otherwise default to 250 (sec). 
    sleep_time = int(os.environ.get('MYSLEEPTIME', 250))
    time.sleep(sleep_time)
    return 'Sorry for the late'

if __name__ == '__main__':
    # Bind to MYPORT if defined, otherwise default to 5000.
    port = int(os.environ.get('MYPORT', 5000))
    app.run(host='0.0.0.0', port=port)

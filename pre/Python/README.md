# Python
## Install python3 for MacOS
```sh
brew install python3
```
---

## virtual Environment
```sh
python3 -m venv myenv
source myenv/bin/activate
```
---
Install Flask: Once the virtual environment is active, you can install Flask:
```sh
pip install flask
```
or install from requirements.txt if available
```sh
pip install -r requirements.txt
```
uninstall
```sh 
pip uninstall flask
```
upgrade 
```sh
pip install flask --upgrade
```

```sh
python3 app2.py
```
---
Now stop previously running app and run app.py with Gunicorn.

If gunicorn is not installed, run **sudo pip install gunicorn --upgrade** and then, to run the app: **gunicorn app:app**

Important Note: The default location for the gunicorn binary is **/usr/bin/gunicorn**.
If the gunicorn binary is installed, in a different location, such as **/usr/lib/python3.6/site-packages/bin/gunicorn**, export this path to the **$PATH** environment variable for the user thor.
This way you can make use of the gunicorn command without having to provide the absolute path.

**gunicorn app:app -w 3** three workers
---

```sh
nohup python3 app.py &
```
What Happens When You Run This Command
The app.py script starts running in the background.
Any output (e.g., logs or errors) is redirected to a file named nohup.out in the current directory unless specified otherwise.

**nohup**:

Stands for "no hang up".
Ensures that the process is not terminated when the terminal session is closed or the user logs out.
**python3 app.py**:

Runs the Python script app.py using Python 3.
**&**:

Puts the process in the background so that you can continue using the terminal for other tasks.

Restart flask app by running:
```sh
pkill python3
```
then:
```sh
nohup python3 app.py &
```
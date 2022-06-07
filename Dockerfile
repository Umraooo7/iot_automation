# our base image
FROM alpine:3.5

# Install python ans pip
RUN apk add --update py2-pip

# upgrade pip
RUN pip install --upgrade pip

# install python modules needed by the python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY device.py /usr/src/app/
COPY message.py /usr/src/app/
COPY service.py /usr/src/app/
COPY main.py /usr/src/app/

# run the application
CMD ["python","/usr/src/app/main.py"]

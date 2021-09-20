# Import Python runtime and set up working directory
FROM python:3.8.3-alpine

#Upgrade pip
RUN pip install --upgrade pip

#adding new user
RUN adduser -D myuser
USER myuser
WORKDIR /home/myuser
ADD . /home/myuser
COPY --chown=myuser requirements.txt requirements.txt

# Install any necessary dependencies
RUN pip3 install --user -r requirements.txt

# Init env. path
ENV PATH="/home/myuser/.local/bin:${PATH}"

COPY --chown=myuser:myuser . .

# Open port 8080 for serving the webpage
EXPOSE 8080

# Run app.py when the container launches
CMD ["python3", "runserver.py"]

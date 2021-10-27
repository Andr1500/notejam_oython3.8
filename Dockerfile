# Import Python runtime and set up working directory
FROM python:3.8.3-alpine

#adding new user
RUN adduser -D myuser
USER myuser
WORKDIR /home/myuser

# Init env. path
ENV PATH="/home/myuser/.local/bin:${PATH}"
COPY --chown=myuser:myuser . .

# Install any necessary dependencies
RUN pip3 install --user -r requirements.txt

# Open port 8080 for serving the webpage
EXPOSE 8080

# Run app.py when the container launches
CMD ["python3", "runserver.py"]

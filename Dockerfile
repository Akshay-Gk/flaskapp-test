FROM alpine:latest
 
ENV FLASK_PORT 8080
 
ENV FLASK_USER flaskapp
 
ENV FLASK_ROOT_DIRECTORY /var/flaskapp/
 
RUN  mkdir $FLASK_ROOT_DIRECTORY
 
RUN adduser -h $FLASK_ROOT_DIRECTORY -s /bin/sh -D $FLASK_USER
 
WORKDIR $FLASK_ROOT_DIRECTORY
 
COPY . .
 
RUN apk update && apk add python3 py3-pip --no-cache
 
RUN pip3 install -r requirement.txt
 
RUN chown -R $FLASK_USER:$FLASK_USER $FLASK_ROOT_DIRECTORY
 
USER $FLASK_USER
 
EXPOSE  $FLASK_PORT
 
ENTRYPOINT ["python3"]
 
CMD ["app.py"]

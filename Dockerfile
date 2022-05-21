FROM python:2-alpine
EXPOSE 53 80 443

ENV PLEXCONNECT_ENABLE_PLEXGDM=True \
    PLEXCONNECT_ENABLE_PLEXCONNECT_AUTODETECT=True \
    PLEXCONNECT_IP_PLEXCONNECT=0.0.0.0 \
    PLEXCONNECT_IP_PMS=xxx \
    PLEXCONNECT_PORT_PMS=32400 \
    PLEXCONNECT_IP_DNSMASTER=8.8.8.8 \
    PLEXCONNECT_PREVENT_ATV_UPDATE=True \
    PLEXCONNECT_HOSTTOINTERCEPT=trailers.apple.com \
    PLEXCONNECT_LOGLEVEL=Normal \
# py2-pillow installs there, but not in default search path, but pip install requires gcc etc
    PYTHONPATH=/usr/lib/python2.7/site-packages

RUN apk add --no-cache openssl git py2-pillow \
 && git clone https://github.com/iBaa/PlexConnect \
 && cd /PlexConnect/assets/certificates \
 && openssl req -new -nodes -newkey rsa:2048 -out trailers.pem -keyout trailers.key -x509 -days 365 -subj "/C=US/CN=trailers.apple.com" \
 && openssl x509 -in trailers.pem -outform der -out trailers.cer \
 && cat trailers.key >> trailers.pem

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD python /PlexConnect/PlexConnect.py

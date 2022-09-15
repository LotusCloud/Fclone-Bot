FROM lotuscloud/fclone:v1

WORKDIR /root/fclone
RUN chmod 777 /root/fclone

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x start.sh
RUN chmod +x fclone 

CMD ["bash","start.sh"]

#!bin/bash
#run pio server
screen -S pio_server -d -m /root/PredictionIO/bin/pio eventserver & \
#cd to issue recommendation engine directory
sleep 10s && \
cd /root/PredictionIO/templates/rec_issues && /root/PredictionIO/bin/pio train  -- --driver-memory 8G && \
screen -S issue_recommendation.deploy -d -m /root/PredictionIO/bin/pio deploy -- --driver-memory 8G && \
sleep 10s && \
# build,train and deploy category prediction engine
cd /root/PredictionIO/templates/auto_category && /root/PredictionIO/bin/pio train -- --driver-memory 8G && \
 /root/PredictionIO/bin/pio deploy --port 8010 -- --driver-memory 8G

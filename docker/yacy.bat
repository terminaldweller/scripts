docker run -d -v yacy_volume:/opt/yacy_search_server/DATA -p 8090:8090 -p 8443:8443 --log-opt max-size=200m --log-opt max-file=2 luccioman/yacy
pause
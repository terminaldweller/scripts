#!/bin/sh

EJABBERD=$(docker ps | grep ejabberd | awk '{print $1}')
docker exec -it ${EJABBERD} bin/ejabberdctl register someuser1 jabber.terminaldweller.com passywo00rd # pragma: allowlist secret
docker exec -it ${EJABBERD} bin/ejabberdctl register someuser2 jabber.terminaldweller.com passywo00rd # pragma: allowlist secret
docker exec -it ${EJABBERD} bin/ejabberdctl register someuser3 jabber.terminaldweller.com passywo00rd # pragma: allowlist secret

# OBS. Lembre-se de adaptar a pasta extensions conforme a necessidade do projeto em questão.
# original source: https://catalog.redhat.com/software/containers/rh-sso-7/sso76-openshift-rhel8/629651e2cddbbde600c0a2ec?container-tabs=dockerfile
FROM registry.redhat.io/rh-sso-7/sso76-openshift-rhel8:7.6

COPY  . /opt/eap/extensions

# ENV KEYCLOAK_EXTENSION_1=https://github.com/<yourUser>/<yourRepo>/raw/main/<yourSPI>

USER root
RUN chmod +x /opt/eap/extensions/postconfigure.sh

RUN chmod 774 /opt/eap/extensions/*.sh

RUN sh /opt/eap/extensions/extensions.sh

USER 185
CMD ["/opt/eap/bin/openshift-launch.sh"]
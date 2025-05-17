# escape=`
FROM lacledeslan/gamesvr-ut99

HEALTHCHECK NONE

ARG BUILDNODE="unspecified"
ARG SOURCE_COMMIT

LABEL com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://github.com/LacledesLAN/README.1ST" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="Laclede's LAN" `
      org.label-schema.description="LL UT99 Deathmatch Dedicated Freeplay Server" `
      org.label-schema.vcs-url="https://github.com/LacledesLAN/gamesvr-ut99"


# Backup the original UnrealTournament.ini, in case we want to revert the live server
RUN cp /app/System/UnrealTournament.ini /app/System/UnrealTournamentBackup.ini

# Copy in our custom server content
COPY --chown=UT99Freeplay:root ./dist/content /app/

# Copy in our custom UnrealTournament.ini
COPY --chown=UT99Freeplay:root ./dist/UnrealTournament.ini /app/System/UnrealTournament.ini

# UPDATE USERNAME & ensure permissions
RUN usermod -l UT99Freeplay UT99

USER UT99Freeplay

WORKDIR /app

CMD ["/bin/bash"]

ONBUILD USER root

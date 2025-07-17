#!/usr/bin/with-contenv bashio
declare config

config=$(\
    bashio::var.json \
        host "$(bashio::addon.ip_address)" \
        port "^$(bashio::addon.port 9001)" \
)

if bashio::discovery "mealie" "${config}" > /dev/null; then
    bashio::log.info "Successfully sent discovery information to Home Assistant."
else
    bashio::log.error "Discovery message to Home Assistant failed!"
fi

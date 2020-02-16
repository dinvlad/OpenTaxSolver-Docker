FROM alpine AS base

WORKDIR /ots

#####

FROM base as build

RUN apk add --no-cache build-base gtk+2.0-dev && \
    wget -q https://sourceforge.net/projects/opentaxsolver/files/latest && \
    unzip -q latest && \
    mv OpenTaxSolver*/* . && \
    rm -rf bin latest Run* OpenTaxSolver* && \
    ./src/Build_*.sh && \
    rm -rf src Run*

#####

FROM base

RUN apk add --no-cache gtk+2.0 numix-themes-gtk2 ttf-opensans

COPY --from=build /ots ./

ENV GTK2_RC_FILES=/usr/share/themes/Numix/gtk-2.0/gtkrc

ENTRYPOINT [ "./bin/ots_gui2" ]

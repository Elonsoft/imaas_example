FROM elixir:1.9.1-alpine as otprelease

RUN apk update && \
    apk upgrade && \
    apk add --no-cache alpine-sdk git openssh build-base && \
    rm -rf /var/cache/apk/*

ENV HOME /app
RUN mkdir $HOME
WORKDIR $HOME

ARG MIX_ENV
ENV MIX_ENV $MIX_ENV

ARG ALLOWED_ORIGINS
ENV ALLOWED_ORIGINS $ALLOWED_ORIGINS

RUN mix local.hex --force && \
    mix local.rebar --force

COPY . .

RUN mix deps.get --only $MIX_ENV && \
    mix compile && \
    mix release

FROM bitwalker/alpine-erlang:latest

ARG MIX_ENV
ENV MIX_ENV $MIX_ENV

ENV PORT 4000

COPY --from=otprelease /app/_build/${MIX_ENV}/rel/imaas ./
COPY --from=yunmikun2/caas:latest /bin/caas /bin

EXPOSE 4000

RUN mkdir uploads

CMD ./bin/imaas start

# IMaaS example

Using ImageMagick as a Service with arc_ecto in Elixir/Phoenix.

Here imagemagick is replaced with `caas` -- ImageMagick as a Service
client. For this setup to work you need to run ImageMagick as a
Service server and provide `CONVERTER_URL` for an application where
`caas` is used.

For more information look at `api/lib/imaas/images/image.ex` and
`api/Dockerfile` for using `caas` binary and at `docker-compose.yml`
for configuring `imaas` server and the main application.

## Code snippetes

### docker-compose.yml

In main docker-compose file configure imaas application:

```yaml
version: '3.7'
networks:
  internal:
    external: false
services:
  # ...
  api:
    # ...
    environment:
      CONVERTER_URL: http://imaas_imagemagick_1:4000
  imagemagick:
    image: yunmikun2/imaas:latest
    restart: unless-stopped
    networks:
      - internal
```

### Dockerfile

Add the following line to the dockerfile of your api applicaion:

```Dockerfile
COPY --from=yunmikun2/caas:latest /bin/caas /bin
```

### Arc image definition

In your arc image definition module define transform so that it uses
`caas` instead default `convert`:

```elixir
defmodule MyApp.Image do
  # ...
  use Arc.Definition
  # ...

  def transform(_, _) do
    {:caas, "-strip -thumbnail 100x100^ -gravity center"}
  end
end
```

## Running

You most possibly need to replace `onlyhome` with `localhost` (or with
the host you are gonna deploy it to) in `.env`. Also, you are gonna
need docker-compose. Run 'docker-compose up --build -d' and then you
can go to `http://localhost:18081/posts` and play a little.

## Architecture

  - `api` is a siple Elixir/Phoenix application that stores "posts" with
    images.

  - `web_client` is a frontend for `imaas` (implemented as another
    Elixir/Phoenix application, yeah).

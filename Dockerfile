FROM golang:alpine as multistage

WORKDIR /src

COPY . .

RUN go build -o /src

FROM scratch

WORKDIR /app

COPY --from=multistage /src /app

ENTRYPOINT ["./df-full-cycle"]
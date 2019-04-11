# etorox-collector

## Run

1. `docker-compose up -d`
1. ...
1. PROFIT! :)

## How it works?

Navigate to http://localhost:3000/api/v1/example?test=123 and you will receive req.query as response and also controller will log req.query

Also you can throw error just by adding "error=true" get param. Ex: http://localhost:3000/api/v1/example?test=123&error=true

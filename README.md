## Requirements

    ruby 2.5.1

## Configure

    bundle install

## Run server

    ruby server.rb

## Test api

### gettransactionnumber

    curl -X POST http://localhost:3000/ewallet-plugin-api-services/services/transactionservice/gettransactionnumber

### sendtransaction

    curl -X POST http://localhost:3000/ewallet-plugin-api-services/services/transactionservice/sendtransaction

### nullifytransaction

    curl -X POST http://localhost:3000/ewallet-plugin-api-services/services/transactionservice/nullifytransaction

    curl -X POST http://localhost:3000/ewallet-plugin-api-services/services/transactionservice/nullifytransaction -d '{"occ":"INVALID OCC"}'

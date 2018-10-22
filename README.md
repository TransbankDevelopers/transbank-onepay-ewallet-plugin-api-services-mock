## Requirements

    ruby 2.5.1

## Configure

    bundle install

## Run server

    ruby server.rb

## Test API

### gettransactionnumber

- local  
  
    curl -X POST http://localhost:3000/ewallet-plugin-api-services/services/transactionservice/gettransactionnumber

- heroku  
  
    curl -X POST https://transbank-onepay-ewallet-mock.herokuapp.com/ewallet-plugin-api-services/services/transactionservice/gettransactionnumber

### sendtransaction

- local  
  
    curl -X POST http://localhost:3000/ewallet-plugin-api-services/services/transactionservice/sendtransaction

- heroku  

    curl -X POST https://transbank-onepay-ewallet-mock.herokuapp.com/ewallet-plugin-api-services/services/transactionservice/sendtransaction
  
### nullifytransaction

- local  
  
    curl -X POST http://localhost:3000/ewallet-plugin-api-services/services/transactionservice/nullifytransaction

    curl -X POST http://localhost:3000/ewallet-plugin-api-services/services/transactionservice/nullifytransaction -d '{"occ":"INVALID OCC"}'

- heroku  

    curl -X POST https://transbank-onepay-ewallet-mock.herokuapp.com/ewallet-plugin-api-services/services/transactionservice/nullifytransaction

    curl -X POST https://transbank-onepay-ewallet-mock.herokuapp.com/ewallet-plugin-api-services/services/transactionservice/nullifytransaction -d '{"occ":"INVALID OCC"}'

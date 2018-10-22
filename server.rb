require 'sinatra'
require 'json'

set :port, 3000

PATH = '/ewallet-plugin-api-services/services/transactionservice'

get "/" do
	"OK"
end

post "#{PATH}/gettransactionnumber" do
    content_type :json
    response = <<~EOF
    {
        "responseCode": "OK",
        "description": "OK",
        "result": {
            "occ": "1807983490979289",
            "authorizationCode": "623245",
            "issuedAt": 1532104549,
            "signature": "FfY4Ab89rC8rEf0qnpGcd0L\/0mcm8SpzcWhJJMbUBK0=",
            "amount": 27500,
            "transactionDesc": "Venta Normal: Sin cuotas",
            "installmentsAmount": 27500,
            "installmentsNumber": 1,
            "buyOrder": "20180720122456123"
        }
    }
    EOF
    status 200
    response
end

post "#{PATH}/sendtransaction" do
    content_type :json
    response = <<~EOF
    {
        "responseCode": "OK",
        "description": "OK",
        "result": {
            "occ": "1807983490979289",
            "ott": 64181789,
            "signature": "USrtuoyAU3l5qeG3Gm2fnxKRs++jQaf1wc8lwA6EZ2o=",
            "externalUniqueNumber": "f506a955-800c-4185-8818-4ef9fca97aae",
            "issuedAt": 1532103896,
            "qrCodeAsBase64": "iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAADmElEQVR42u3dQW4CMRBE0bn\/peEEbBCmq9rvS9lFxDP221jEfl6SPvZ4BRIgEiASIBIgEiASIBIgEiASIJIAkQCRAJEAkQCRAJEAkQCRAJEAkQSIBIgEiASIdAuQ53kqfn71XKffT9rntMwXIIAAAggggAACCCCAAAIIIIAAAsh\/FlLLeKYWxunP2TpfgAACCCCAAAIIIIAAAggggAACCCDfPeDUQto6ntvmCxBAAAEEEEAAAQQQQAABBBBAAAHkTiBT4zw9HkAAAQQQQAABBBBAAAEEEEAAAQQQQG5+4S3breYLEEAAAQQQQAABBBBAAAEEEEAAASTlAZMW8FYgm9cPIIAAAggggAACCCCAAAIIIIAAAkjPcfp+3\/UHgAACCCCAAAIIIIAAAggggAACyA1A2ku7tiBxIa2de68AEAECiAABBBBAAAEEEEAAuQhI+wJrv55gapynxw8IIIAAAggggAACCCCAAAIIIIAA8h8gUwvg9IJp34adGqdv8wICCCCAAAIIIIAAAggggAACCCA7gLRc4pm2UG\/bZgcEEEAAAQQQQAABBBBAAAEEEEAAyQTSss3Ycl1C2vYyIIAAAggggAACCCCAAAIIIIAAAkjmwXFp1wGkPW\/atvDWeQEEEEAAAQQQQAABBBBAAAEEEEAA+W4i2hd2y\/O2\/8szIIAAAggggAACCCCAAAIIIIAAAkjmtu3Ugkw7mK4dDiCAAAIIIIAAAggggAACCCCAAALI7m3etG3JlvfQAhYQQAABBBBAAAEEEEAAAQQQQAAB5M6D47aCmgLYcrAeIIAAAggggAACCCCAAAIIIIAAAsju2oG3XBvhy4qAAAIIIIAAAggggAgQQAQIIJnbvGk\/p8ffAnPrNjIggAACCCCAAAIIIIAAAggggAACyG8numXbNm27Mu3vblg\/gAACCCCAAAIIIIAAAggggAACCCBz26q3HYzWsp0OCCCAAAIIIIAAAggggAACCCCAAALIiRfe8qXKtHlJPCAOEEAAAQQQQAABBBBAAAEEEEAAAWTvNm\/L52z9u4AAAggggAACCCCAAAIIIIAAAgggs0BawJ4eT\/sCa4IACCCAAAIIIIAAAggggAACCCCAAOL6gy2XeG49cA8QQAABBBBAAAEEEEAAAQQQQAABROoOEAkQCRAJEAkQCRAJEAkQCRAJEEmASIBIgEiASIBIgEiASIBIgEiASAJEAkQCRAJESugNVyLVvcNSF1EAAAAASUVORK5CYII="
        }
    }
    EOF
    status 200
    response
end

post "#{PATH}/nullifytransaction" do
	content_type :json
	params_s = request.body.read
    params = JSON.parse(params_s.empty? ? '{}' : params_s)
    if !params['occ'].nil? && params['occ'] == "INVALID OCC"
        response = <<~EOF
        {
            "responseCode": "INVALID_PARAMS",
            "description": "Parametros invalidos",
            "result": null
        }
        EOF
    else
        response = <<~EOF
        {
            "responseCode": "OK",
            "description": "OK",
            "result": {
                "occ": "1807983490979289",
                "externalUniqueNumber": "f506a955-800c-4185-8818-4ef9fca97aae",
                "reverseCode": "623245",
                "issuedAt": 1532104252,
                "signature": "52NpZBolTEs+ckNOXwGRexDetY9MOaX1QbFYkjPymf4="
            }
        }
        EOF
    end
    status 200
    response
end

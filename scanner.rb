[
	'open-uri',
	'openssl',
	'json'
].each{|g|
	require g
}

url = 'https://data.cityofnewyork.us/resource/y6h5-jvss.json?$where=hearing_status=%27NEW%20ISSUANCE%27'
sslVerifyHash = {
	:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE
}

responseJSON = open(url,sslVerifyHash).read
responseArray = JSON.parse(responseJSON) # Length 1000
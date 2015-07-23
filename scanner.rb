[
	'open-uri',
	'openssl',
	'date',
	'json'
].each{|g|
	require g
}

def getViolations(offsetNumber)
	url = 'https://data.cityofnewyork.us/resource/y6h5-jvss.json?$where=hearing_status=%27NEW%20ISSUANCE%27&$offset='+offsetNumber.to_s

	sslVerifyHash = {
		:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE
	}
	responseJSON = open(url,sslVerifyHash).read
	responseArray = JSON.parse(responseJSON) # Length 1000

	if(responseArray.length===0)
		return false
	end

	
	responseArray.each{|violation|
		p violation,
		'======'
	}

	getViolations(offsetNumber+=1000)
end

getViolations(0)
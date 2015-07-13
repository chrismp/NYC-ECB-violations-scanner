[
	'open-uri',
	'date',
	'json'
].each{|g|
	require g
}


baseURL = 'http://data.cityofnewyork.us/resource/y6h5-jvss.json'
where = '?$where='
violationDate = 'violation_date='

dateSuffix = 'T00:00:00'
today = Date.today
soQLQueryValue = '\''+today.to_s+dateSuffix+'\''

# url = baseURL+where+violationDate+'\'2015-07-09T00:00:00\''
url = baseURL+where+violationDate+soQLQueryValue
encodedURL = URI.encode(url)
jsonResult = open(encodedURL).read
hashResult = JSON.parse(jsonResult)
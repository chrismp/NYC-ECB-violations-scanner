[
	'mechanize',
	'json',
	'pp'
].each{|g|
	require g
}

agent = Mechanize.new
agent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE # Get around site's SSL problems

url = 'https://data.cityofnewyork.us/views/INLINE/rows.json?accessType=WEBSITE&method=getByIds&asHashes=true&start=0&length=50&meta=true'
postHash = {
	'accessType'=>'WEBSITE',
	'asHashes'=>'true',
	'length'=>'50',
	'meta'=>'true',
	'method'=>'getByIds',
	'start'=>'0'
}

puts agent.post(url,postHash)
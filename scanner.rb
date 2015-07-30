[
	'open-uri',
	'openssl',
	'date',
	'json'
].each{|g|
	require g
}

[
	'helpers/methods',
	'models/init'
].each{|rb|
	require_relative rb+'.rb'
}

getViolations(0)
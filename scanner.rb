[
	'open-uri',
	'openssl',
	'date',
	'pp',
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
		hearingLocation = violation['scheduled_hearing_location']
		ticketNumber = violation['ticket_number']
		respondentStreet = violation['respondent_address_street_name']
		respondentZip = violation['respondent_address_zip_code']
		respondentCity = violation['respondent_address_city']
		respondentState = violation['respondent_address_state_name']
		respondentBorough = violation['respondent_address_borough']
		repondentFirstName = violation['respondent_first_name']
		respondentLastName = violation['respondent_last_name']
		violationStreetName = violation['violation_location_street_name']
		violationBorough = violation['violation_location_borough']
		violationState = violation['violation_location_state_name']
		violationAmount = violation['total_violation_amount']
		violationTime = violation['violation_time']
		decisionDate = violation['decision_date']
		complianceStatus = violation['compliance_status']
		hearingResult = violation['hearing_result']
		hearingStatus = violation['hearing_status']
		hearingDate = violation['hearing_date']
		hearingTime = violation['hearing_time']
		balanceDue = violation['balance_due']
		penalty = violation['penalty_imposed']
		charge1Code = violation['charge_1_code']
		charge1CodeSection = violation['charge_1_code_section']
		charge1Description = violation['charge_1_code_description']
		issuingAgency = violation['issuing_agency']
	}

	getViolations(offsetNumber+=1000)
end

getViolations(0)
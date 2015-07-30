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
		newViolation = Violation.new
		newViolation.ticketNumber = violation['ticket_number']
		newViolation.hearingLocation = violation['scheduled_hearing_location']
		newViolation.respondentStreet = violation['respondent_address_street_name']
		newViolation.respondentZip = violation['respondent_address_zip_code']
		newViolation.respondentCity = violation['respondent_address_city']
		newViolation.respondentState = violation['respondent_address_state_name']
		newViolation.respondentBorough = violation['respondent_address_borough']
		newViolation.repondentFirstName = violation['respondent_first_name']
		newViolation.respondentLastName = violation['respondent_last_name']
		newViolation.violationStreetName = violation['violation_location_street_name']
		newViolation.violationBorough = violation['violation_location_borough']
		newViolation.violationState = violation['violation_location_state_name']
		newViolation.violationAmount = violation['total_violation_amount']
		newViolation.violationTime = violation['violation_time']
		newViolation.decisionDate = violation['decision_date']
		newViolation.complianceStatus = violation['compliance_status']
		newViolation.hearingResult = violation['hearing_result']
		newViolation.hearingStatus = violation['hearing_status']
		newViolation.hearingDate = violation['hearing_date']
		newViolation.hearingTime = violation['hearing_time']
		newViolation.balanceDue = violation['balance_due']
		newViolation.penalty = violation['penalty_imposed']
		newViolation.charge1Code = violation['charge_1_code']
		newViolation.charge1CodeSection = violation['charge_1_code_section']
		newViolation.charge1Description = violation['charge_1_code_description']
		newViolation.issuingAgency = violation['issuing_agency']
		newViolation.save_changes
	}

	getViolations(offsetNumber+=1000)
end
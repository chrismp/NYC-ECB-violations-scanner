

DB.create_table? :NYCECBViolations do 
	primary_key :Row
	varchar :ticketNumber, :unique=>true
	varchar :hearingLocation
	varchar :respondentStreet
	varchar :respondentZip
	varchar :respondentCity
	varchar :respondentState
	varchar :respondentBorough
	varchar :repondentFirstName
	varchar :respondentLastName
	varchar :violationStreetName
	varchar :violationBorough
	varchar :violationState
	varchar :violationAmount
	varchar :violationTime
	varchar :decisionDate
	varchar :complianceStatus
	varchar :hearingResult
	varchar :hearingStatus
	varchar :hearingDate
	varchar :hearingTime
	varchar :balanceDue
	varchar :penalty
	varchar :charge1Code
	varchar :charge1CodeSection
	varchar :charge1Description
	varchar :issuingAgency
end


require_relative 'classes.rb'
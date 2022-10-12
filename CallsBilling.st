!classDefinition: #Country category: 'CallsBilling'!
Object subclass: #Country
	instanceVariableNames: 'name cost'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CallsBilling'!

!Country methodsFor: 'initialization' stamp: 'GDU 10/11/2022 11:29:27'!
initializeName: anName fixedCostForCall: anCost 
	
	name := anName.
	cost := anCost.! !


!Country methodsFor: 'accessing' stamp: 'GDU 10/11/2022 12:15:36'!
callCostPerMinute
	
	^cost! !

!Country methodsFor: 'accessing' stamp: 'GDU 10/11/2022 12:14:59'!
fixedCostForCall
	
	^cost! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Country class' category: 'CallsBilling'!
Country class
	instanceVariableNames: ''!

!Country class methodsFor: 'instance creation' stamp: 'GDU 10/11/2022 11:20:01'!
name: anCountry 
	
	^self new initializeName: anCountry ! !

!Country class methodsFor: 'instance creation' stamp: 'GDU 10/11/2022 11:29:17'!
name: anName fixedCostForCall: anCost
	
	^self new initializeName: anName fixedCostForCall: anCost! !


!classDefinition: #InternationalCall category: 'CallsBilling'!
Object subclass: #InternationalCall
	instanceVariableNames: 'country duration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CallsBilling'!

!InternationalCall methodsFor: 'accessing' stamp: 'GDU 10/11/2022 15:23:01'!
cost
	
	^ duration * (country fixedCostForCall).! !


!InternationalCall methodsFor: 'initialization' stamp: 'GDU 10/11/2022 15:27:58'!
initializeMadeTowards: aCountry ofDuration: aDuration 
	
	country := aCountry.
	duration := aDuration.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InternationalCall class' category: 'CallsBilling'!
InternationalCall class
	instanceVariableNames: ''!

!InternationalCall class methodsFor: 'instance creation' stamp: 'GDU 10/12/2022 11:22:28'!
madeTowards: aCountry ofDuration: aDuration 
	
	^self new initializeMadeTowards: aCountry ofDuration: aDuration ! !


!classDefinition: #Invoice category: 'CallsBilling'!
Object subclass: #Invoice
	instanceVariableNames: 'monthlyPayment nationalLog internationalLog localLog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CallsBilling'!

!Invoice methodsFor: 'actions' stamp: 'GDU 10/11/2022 15:39:51'!
assignMonthlyPayment
	
	monthlyPayment := 100! !

!Invoice methodsFor: 'actions' stamp: 'GDU 10/12/2022 19:11:47'!
printInvoice
	
	|stringOfCosts|
	
	stringOfCosts := String new ,
	'consumptionOfLocalCalls  ', self costForLocalCalls printString , ' Pesos', String newLineString ,
	'consumptionOfNationalCalls  ', self costForNationalCalls printString , ' Pesos', String newLineString ,
	'consumptionOfInternationalCalls  ', self costForInternationalCalls printString , ' Pesos'.
	
	^stringOfCosts ! !

!Invoice methodsFor: 'actions' stamp: 'GDU 10/11/2022 15:42:46'!
registerInternationalCall: aInternationalCall 
	
	internationalLog add: aInternationalCall cost! !

!Invoice methodsFor: 'actions' stamp: 'GDU 10/11/2022 15:42:30'!
registerLocalCall: aLocalCall
	
	localLog add: aLocalCall cost! !

!Invoice methodsFor: 'actions' stamp: 'GDU 10/11/2022 15:42:19'!
registerNationalCall: aNationalCall 
	
	nationalLog add: aNationalCall cost! !


!Invoice methodsFor: 'accessing' stamp: 'GDU 10/12/2022 12:03:37'!
costForInternationalCalls
	
	^ internationalLog inject: 0 into:[:subTotal :next | subTotal + next]. ! !

!Invoice methodsFor: 'accessing' stamp: 'GDU 10/12/2022 12:04:02'!
costForLocalCalls
	
	
	^ localLog inject: 0 into:[:subTotal :next | subTotal + next] ! !

!Invoice methodsFor: 'accessing' stamp: 'GDU 10/12/2022 12:04:17'!
costForNationalCalls
	
	^ nationalLog inject: 0 into:[:subTotal :next | subTotal + next].! !

!Invoice methodsFor: 'accessing' stamp: 'GDU 10/11/2022 15:38:19'!
initializeInternationalCallsLog
	
	internationalLog := OrderedCollection new.! !

!Invoice methodsFor: 'accessing' stamp: 'GDU 10/11/2022 15:36:57'!
initializeLocalCallsLog
	
	localLog :=  OrderedCollection new.! !

!Invoice methodsFor: 'accessing' stamp: 'GDU 10/11/2022 15:37:57'!
initializeNationalCallsLog
	
	nationalLog := OrderedCollection new.! !

!Invoice methodsFor: 'accessing' stamp: 'GDU 10/11/2022 15:38:02'!
internationalCallsLog
	
	^internationalLog ! !

!Invoice methodsFor: 'accessing' stamp: 'GDU 10/11/2022 15:37:04'!
localCallsLog
	
	^localLog ! !

!Invoice methodsFor: 'accessing' stamp: 'GDU 10/11/2022 15:36:18'!
monthlyPayment
	
	^monthlyPayment! !

!Invoice methodsFor: 'accessing' stamp: 'GDU 10/11/2022 15:38:08'!
nationalCallsLog
	
	^nationalLog ! !

!Invoice methodsFor: 'accessing' stamp: 'GDU 10/12/2022 12:14:58'!
onlyCostForCalls
	
	^ self costForLocalCalls + self costForNationalCalls + self costForInternationalCalls ! !

!Invoice methodsFor: 'accessing' stamp: 'GDU 10/12/2022 12:16:11'!
sumOfInvoiceCosts
	
	^ self monthlyPayment + self costForLocalCalls + self costForNationalCalls + self costForInternationalCalls ! !


!Invoice methodsFor: 'initialization' stamp: 'GDU 10/11/2022 15:47:27'!
initialize
	
	monthlyPayment := 100.
	localLog := OrderedCollection new.
	nationalLog := OrderedCollection new.
	internationalLog := OrderedCollection new.! !


!classDefinition: #LocalCall category: 'CallsBilling'!
Object subclass: #LocalCall
	instanceVariableNames: 'dayOfWeek hour duration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CallsBilling'!

!LocalCall methodsFor: 'initialization' stamp: 'GDU 10/11/2022 15:27:45'!
initializeMadedToDay: aDayOfWeek aT: anHour ofDuration: aDuration 
	
	dayOfWeek := aDayOfWeek.
	hour := anHour.
	duration := aDuration.! !


!LocalCall methodsFor: 'accesing' stamp: 'GDU 10/12/2022 11:07:47'!
cost
	| businessDays|
	businessDays := {'Monday' . 'Tuesday' . 'Wednesday' . 'Thursday' . 'Friday'}.
	businessDays detect: [:unDia | (unDia = dayOfWeek ) & (hour >= 8 & hour <= 20)] ifNone: [^ (duration * 0.10)].
	^ (duration * (0.20)).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LocalCall class' category: 'CallsBilling'!
LocalCall class
	instanceVariableNames: ''!

!LocalCall class methodsFor: 'instance creation' stamp: 'GDU 10/12/2022 11:21:31'!
madedToDay: aDay aT: aHour ofDuration: aDuration 
	
	^self new initializeMadedToDay: aDay aT: aHour ofDuration: aDuration! !


!classDefinition: #NationalCall category: 'CallsBilling'!
Object subclass: #NationalCall
	instanceVariableNames: 'province duration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CallsBilling'!

!NationalCall methodsFor: 'initialization' stamp: 'GDU 10/11/2022 15:25:05'!
initializeWithDestiny: aProvince ofDuration: aDuration 
	
	province := aProvince.
	duration := aDuration.! !


!NationalCall methodsFor: 'accesing' stamp: 'GDU 10/11/2022 12:13:31'!
cost
	
	^ duration * (province cost)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NationalCall class' category: 'CallsBilling'!
NationalCall class
	instanceVariableNames: ''!

!NationalCall class methodsFor: 'instance creation' stamp: 'GDU 10/11/2022 12:00:43'!
conDestino: anProvince 
	
	^self new initializeConDestino: anProvince ! !

!NationalCall class methodsFor: 'instance creation' stamp: 'GDU 10/11/2022 15:24:51'!
conDestino: anProvince deDuracion: anDuration 
	
	^self new initializeWithDestiny: anProvince ofDuration: anDuration ! !

!NationalCall class methodsFor: 'instance creation' stamp: 'GDU 10/12/2022 11:55:00'!
withDestiny: aProvince ofDuration: aDuration 
	
	^self new initializeWithDestiny: aProvince ofDuration: aDuration! !


!classDefinition: #Province category: 'CallsBilling'!
Object subclass: #Province
	instanceVariableNames: 'province cost'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CallsBilling'!

!Province methodsFor: 'initialization' stamp: 'GDU 10/11/2022 15:24:11'!
initializeWithName: aProvince fixedCostForCallPerMinute: aCost 
	
	province := aProvince.
	cost := aCost.! !


!Province methodsFor: 'accesing' stamp: 'GDU 10/11/2022 11:54:13'!
cost
	
	^cost! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Province class' category: 'CallsBilling'!
Province class
	instanceVariableNames: ''!

!Province class methodsFor: 'instance creation' stamp: 'GDU 10/11/2022 11:53:50'!
withName: anAProvince fixedCostForCallPerMinute: aCost
	
	^self new initializeWithName: anAProvince fixedCostForCallPerMinute: aCost! !
!classDefinition: #'CallsBilling-Tests' category: 'CallsBilling-Tests'!
TestCase subclass: #'CallsBilling-Tests'
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CallsBilling-Tests'!

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/11/2022 22:37:11'!
test001_anInvoiceHasAMonthlyPaymentOfOneHundredPesos
	
	|invoice|
	
	invoice := Invoice new.
	
	invoice assignMonthlyPayment.
	
	Assert that: invoice monthlyPayment isEqualTo: 100! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/11/2022 21:36:25'!
test002_anInvoiceHasALogOfLocalCallsThatAtTheBeginningOfTheMonthIsEmpty
	
	|invoice|
	
	invoice := Invoice new.
	
	invoice initializeLocalCallsLog.
	
	Assert isTrue: invoice localCallsLog isEmpty! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/11/2022 21:36:08'!
test003_anInvoiceHasALogOfNationalCallsThatAtBeginningOfTheMonthIsEmpty
	
	|invoice|
	
	invoice := Invoice new.
	
	invoice initializeNationalCallsLog.
	
	Assert isTrue: invoice nationalCallsLog isEmpty! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/11/2022 21:37:42'!
test004_anInvoiceHasALogOfInternationalCallsThatAtBeginningOfTheMonthIsEmpty
	
	|invoice|
	
	invoice := Invoice new.
	
	invoice initializeInternationalCallsLog.
	
	Assert isTrue: invoice internationalCallsLog isEmpty! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:20:35'!
test005_whenALocalCallIsLastingTenMinutesMadeOnMondayAtEightAmIsRecordedTheExpectedCostIsTwoPesos
	
	|localCall invoice|
	
	localCall := LocalCall madedToDay: 'Monday' aT: 8 ofDuration: 10.
	
	invoice := Invoice initializedInstance.
	
	invoice registerLocalCall: localCall.
	
	Assert that: localCall cost isEqualTo: 2.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:21:41'!
test006_whenALocalCallLastingFiveMinutesMadeOnTuesdayAtEightAmTheExpectedCostIsOneDotZero
	
	|localCall invoice|
	
	localCall := LocalCall madedToDay: 'Tuesday' aT: 8 ofDuration: 5.
	
	invoice := Invoice initializedInstance.
	
	invoice registerLocalCall: localCall.
	
	Assert that: localCall cost isEqualTo: 1.0! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:21:47'!
test007_whenALocalCallLastingFiveMinutesMadeOnMondayAtTwentyOnePmTheExpectedCostIsZeroDotFivePesos
	
	|localCall invoice|
	
	localCall := LocalCall madedToDay: 'Monday' aT: 21 ofDuration: 5.
	
	invoice := Invoice initializedInstance.
	
	invoice registerLocalCall: localCall .
	
	Assert that: localCall cost isEqualTo: 0.5! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:21:52'!
test008_whenALocalCallLastingFiveMinutesMadeOnSaturdayAtTwentyOnePmTheExpectedCostIsZeroDotFivePesos
	
	|localCall invoice|
	
	localCall := LocalCall madedToDay: 'Saturday' aT: 21 ofDuration: 5.
	
	invoice := Invoice initializedInstance .
	
	invoice registerLocalCall: localCall .
	
	Assert that: localCall cost isEqualTo: 0.5! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:09:18'!
test009_theCostPerMinuteForCallsToBrazilIsFivePesos
	
	|country|
	
	country := Country name: 'Brazil' fixedCostForCall: 5.
	
	Assert that: country callCostPerMinute isEqualTo: 5.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:09:12'!
test010_theCostPerMinuteOfCallsToUnitedStatesIsTenPesos
	
	|country|
	
	country := Country name: 'United States' fixedCostForCall: 10.
	
	Assert that: country callCostPerMinute isEqualTo: 10.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:22:04'!
test011_whenRegisteringAnInternationalCallToBrazilIsLastingOneMinuteTheCostIsFivePesos
	
	|internationalCall invoice|
	
	invoice := Invoice initializedInstance .
	
	internationalCall := InternationalCall madeTowards: (Country name: 'Brazil' fixedCostForCall: 5) ofDuration: 1.
	
	invoice registerInternationalCall: internationalCall.
	
	Assert that: internationalCall cost isEqualTo: 5.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:22:39'!
test012_whenRegisteringAnInternationalCallToTheUnitedStatesLastingOneMinuteTheCostIsTenPesos
	
	|internationalCall invoice|
	
	invoice := Invoice initializedInstance .
	
	internationalCall := InternationalCall madeTowards: (Country name: 'United States' fixedCostForCall: 10) ofDuration: 1.
	
	invoice registerInternationalCall: internationalCall.
	
	Assert that: internationalCall cost isEqualTo: 10.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/11/2022 22:26:24'!
test013_theCostPerMinuteOfANationalCallToBuenosAiresIsTwoPesos
	
	|province|
	
	province := Province withName: 'Buenos Aires' fixedCostForCallPerMinute: 2.
	
	Assert that: province cost isEqualTo: 2.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/11/2022 22:27:07'!
test014_theCostPerMinuteOfANationalCallToSantaFeIsOneDotFivePesos
	
	|province|
	
	province := Province withName: 'Santa Fe' fixedCostForCallPerMinute: 1.5.
	
	Assert that: province cost isEqualTo: 1.5.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/11/2022 22:27:41'!
test015_theCostPerMinuteOfANationalCallToSanJuanIsOnePesos
	
	|province|
	
	province := Province withName: 'San Juan' fixedCostForCallPerMinute: 1.
	
	Assert that: province cost isEqualTo: 1.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:54:38'!
test016_whenANationalCallIsRegisteredToSanJuanLastingOneMinuteTheCostIsOnePeso
	
	|nationalCall invoice|
	
	invoice := Invoice initializedInstance.
	
	nationalCall := NationalCall withDestiny: (Province withName: 'San Juan' fixedCostForCallPerMinute: 1) ofDuration: 1.
	
	invoice registerNationalCall: nationalCall.
	
	Assert that: nationalCall cost isEqualTo: 1.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:55:15'!
test017_whenANationalCallIsRegisteredToBuenosAiresLastingOneMinuteTheCostIsTwoPesos
	
	|nationalCall invoice|
	
	invoice := Invoice initializedInstance.
	
	nationalCall := NationalCall withDestiny: (Province withName: 'Buenos Aires' fixedCostForCallPerMinute: 2) ofDuration: 1.
	
	invoice registerNationalCall: nationalCall.
	
	Assert that: nationalCall cost isEqualTo: 2.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:25:33'!
test018_whenTwoLocalCallsAreRecordedOneOnABusinessDayAndTheOtherAnTheWeekendEachLastingTwoMinutesTheAmountOfConsumptionForLocalCallsOnTheBillIsZeroDotSixPesos
	
	|firstLocalCall secondLocalCall invoice expectedCost |
	
	invoice := Invoice initializedInstance.
	
	firstLocalCall := LocalCall madedToDay: 'Monday' aT: 8 ofDuration: 2.
	
	secondLocalCall := LocalCall madedToDay: 'Sunday' aT: 20  ofDuration: 2.
	
	invoice registerLocalCall: firstLocalCall.
	
	invoice registerLocalCall: secondLocalCall. 
	
	expectedCost := (firstLocalCall cost) + (secondLocalCall cost).
	
	Assert that: invoice costForLocalCalls isEqualTo: expectedCost.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 11:27:42'!
test019_whenTwoInternationalCallsToBrazilOfTwoMinutesDurationAreRegisteredTheSumOfConsumptionForInternationalCallsInTheBillIsTwentyPesos
	
	|firstInternationalCall secondInternationalCall invoice expectedCost |
	
	invoice := Invoice initializedInstance.
	
	firstInternationalCall := InternationalCall madeTowards: (Country name: 'Brazil' fixedCostForCall: 5) ofDuration: 2.
	
	secondInternationalCall := InternationalCall madeTowards: (Country name: 'Brazil' fixedCostForCall: 5) ofDuration: 2.
	
	invoice registerInternationalCall: firstInternationalCall.
	
	invoice registerInternationalCall: secondInternationalCall.
	
	expectedCost := (firstInternationalCall cost) + (secondInternationalCall cost).
	
	Assert that: invoice costForInternationalCalls isEqualTo: expectedCost.! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/11/2022 22:45:32'!
test020_theGeneralConsumptionOfABillingWithoutRegisteredAnyCallsIsOnlyTheCostOfTheMonthlyPayment
	
	|invoice expectedBillingCost|
	
	invoice := Invoice initializedInstance.
	
	expectedBillingCost := (invoice monthlyPayment ).
	
	Assert that: invoice sumOfInvoiceCosts  isEqualTo: expectedBillingCost! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/11/2022 22:47:30'!
test021_theGeneralConsumptionOfABillingIsTheSumOfAllTheConsumptionForPossibleCallsPlusTheMonthlyPayment
	
	|invoice expectedBillingCost|
	
	invoice := Invoice initializedInstance.
	
	expectedBillingCost := (invoice monthlyPayment ) + (invoice costForLocalCalls) + (invoice costForNationalCalls) + (invoice costForInternationalCalls).
	
	Assert that: invoice sumOfInvoiceCosts  isEqualTo: expectedBillingCost! !

!CallsBilling-Tests methodsFor: 'as yet unclassified' stamp: 'GDU 10/12/2022 12:12:02'!
test022_whenTwoNationalCallsAreRegisteredOneToBuenosAiresAndAnotherToSantaFeLastingThreeMinutesAnInternationalCallToBrazilLastingTwoMinutesAndALocalCallOnABusinessDayAtTwentyTwoAtNightLastingTenMinutesTheTotalCostOfTheBillingIsTheExpectedAmount
	
	|firstNationalCall secondNationalCall internationalCall localCall invoice expectedCost |
	
	invoice := Invoice initializedInstance.
	
	localCall := LocalCall madedToDay: 'Tuesday' aT: 22 ofDuration: 10.
	
	internationalCall := InternationalCall madeTowards: (Country name: 'Brazil' fixedCostForCall: 5) ofDuration: 2.
	
	firstNationalCall := NationalCall withDestiny: (Province withName: 'Buenos Aires' fixedCostForCallPerMinute: 2) ofDuration: 3.
	
	secondNationalCall := NationalCall conDestino: (Province withName: 'Santa Fe' fixedCostForCallPerMinute: 1) deDuracion: 3.
	
	invoice registerLocalCall: localCall.
	
	invoice registerInternationalCall: internationalCall.
	
	invoice registerNationalCall: firstNationalCall.
	
	invoice registerNationalCall: secondNationalCall. 
	
	expectedCost := (invoice costForLocalCalls) + (invoice costForNationalCalls) + (invoice costForInternationalCalls).
	
	Assert that: invoice onlyCostForCalls isEqualTo: expectedCost.! !

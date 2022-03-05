This line and every thing written before the first Test Data section defined by Robot Framework will be ignored.

*** Settings ***
Documentation	This is just a demo usage of Robot Framework <start>. 
...				Space format is used. 
...				No non-ASCII chars used & file is saved in UTF-8 by default. \nNo reStructuredText (.rst or .rest) used.
...				In case of conflict having the same keyword from different sources, use "Set Library Search Order" to prioritize the importing.
...				Parallel execution of keywords should be implemented at a test library level.
...				Continue test suite when error on some test case is found by "Run Keyword And Ignore Error" or some other builtins.
...				To check the .robot implementation without integrating with other sources or libs, use "--dryrun" mode specified in Robot FW.

#Library to import user-defined keywords, low-level libraries , user-defined libs. Arguments will be processed at run time.
Library		WindowsHelper	${PRG_NAME}	${TEXT1} ${TEXT2}
Library		BrowserHelper	${BROWSER}	${URL}	${HTTPcode}	${text}		

Resource	resources.resource		#file extension .robot is acceptable. To import user-defined keywords

Variable	variables.py			#To import external variables

Timeout		1 minute 30 seconds		#To setup a default timeout value for this test suite

Suite Setup	Set Log Level	TRACE	#The log level can also be: INFO, FAIL, WARN, DEBUG & set via commandline argument

Default Tags	Demo


*** Variables ***
#This section is for local variables declaration 
${TEXT1}	Hello
${TEXT2}	World!

*** Test Cases ***
Test Case \#1: ECHO command on CMD or Terminal
	#Example of using Named Argument with variable
	[Arguments]	${Timeout}	${TEXT1}	${TEXT2}
	[Documentation] Test Echo command on a CMD or Terminal
	Open CMD or Terminal window
	[Timeout]	${Timeout}
	#Example of keyword having more than one argument. the value of scalar argument is by default converted to string
	Type ECHO command on CMD on Terminal window with "${TEXT1} ${TEXT2}"	
	Typed text should be displayed on CMD or Terminal window


Test Case \#2: open google.com on a default browser
	#Example of using Free Named Argument (no pre-defined argument number OR kwargs)
	[Documentation] Test if using Selenium can open an URL on a default web browser
	Given	Default browser is opened
	[Timeout]	${Timeout} #Value from setting section
	When	${HTTPcode} = Open ${URL} on a browser
	and	Response should be equal to ${HTTPcode}
	#Example of using loop in .robot & getting value from an external list
	Then	FOR ${text} IN @{SAMPLE_EXTERNAL_VAR}
			Type ${text} into a search box
		END

Test case \#3: check a failure builtin
	Set Tags	builtin-demo
	Fail Print an user-defined error message...


#*** Tasks ***
#This section is recommended for other automation purposes rather than test automation. The syntax is similar to Test Cases section.
#It is an error to have both tests and tasks in same file. Thus, I don't place it here.

*** Keywords ***
#This section is used when keywords are not imported from external sources.

#For the implementation of test case 1
Open CMD or Terminal window
    Open program from shell ${PRG_NAME}
    Current process list on OS should have ${PRG_NAME} running

Type ECHO command on CMD on Terminal window with "${TEXT1} ${TEXT2}"
	Input to commandline "${TEXT1} ${TEXT2}"
	Press Enter

Typed text should be displayed on CMD or Terminal window
	Check result of commandline output

*** Comments ***
This is just a demo usage of Robot Framework <end>. This line will be ignored.

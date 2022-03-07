from appium import webdriver

class WindowsHelper():
	#This class gets use of WinAppDriver (Windows SDK) via Appium server to automate actions on Windows 10+. See more at: https://github.com/microsoft/WinAppDriver

	def __init__(self):
		self.desired_caps = {}
    		#self.desired_caps["app"] = ''
    		self.driver = webdriver.Remote(command_executor='http://127.0.0.1:4723', desired_capabilities=desired_caps)


	def open_program_from_shell(self, prg_name):
		self.driver.find_element_by_name("Type here to search").click()
		self.driver.find_element_by_name("Search box").send_keys(prg_name)
		self.driver.find_element_by_name("Command Prompt, App, Press right to switch preview").send_keys('\ue007') #Press enter

	def input_to_commandline(self, string):
		cmd_text_area = self.driver.find_element_by_name("Text Area")
		cmd_text_area.send_keys(string)
		cmd_text_area..send_keys('\ue007') #Press enter

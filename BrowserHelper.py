import subprocess
#from selenium import webdriver
#from selenium.webdriver.common.by import By

class BrowserHelper(object):

	def __init__(self):
		option = webdriver.ChromeOptions()
    		option.add_argument("--start-maximized")
    # start of headless mode config
    		option.add_argument("--headless")
    		option.add_argument("--disable-gpu")
    		option.add_argument("--disable-dev-shm-usage")
    		option.add_argument("--no-sandbox")
    		option.add_argument("--window-size=1920,1080")
    		option.add_argument("--no-first-run")
    		option.add_argument("--no-default-browser-check")
    		option.add_argument("--ignore-certificate-errors")
    #end of headless mode config
    		self.ChromeDriver = webdriver.Chrome(r'chromedriver.exe', chrome_options=option)
    		self.implicit_wait = 50

	def access_to_url(self, url):
		self.ChromeDriver.get(url)

	def input_to_google_textbox(self, keyword):
		try:
            		search_box = self.ChromeDriver.find_element(By.CLASS_NAME, "gLFyf gsfi")
            		search_box.send_keys(keyword)
            		search_box.send_keys(Keys.ENTER)
            		WebDriverWait(self.ChromeDriver, self.implicit_wait)
        	except:
            		print("Search on Google SE can not be performed")  

	def verify_google_serp_display(self):
		serp = self.ChromeDriver.find_element(By.ID, "search")
        	if (serp is not None):
            		return True




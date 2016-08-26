import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
import time
import random
import re

class TripAdvisorTest(unittest.TestCase):

	def setUp(self):
		self.driver=webdriver.Firefox()
		kw="mm"

	def convert_date(self, current_month):

		conv = time.strptime(current_month, "%a %b %d %Y")
		return conv

	def pick_date_fumction(self):

		"""get_the_current_month_xpath=self.driver.find_element_by_xpath("//div[@class='month']//table//thead//tr//th")
		current_month=get_the_current_month_xpath.text
		print current_month
		conv=self.convert_date(current_month)
		c_year=conv.tm_year
		c_month=conv.tm_mon"""
		date=self.driver.find_element_by_class_name("day day_28")
		date.click()


	def test_main_page_check(self):
		driver = self.driver
		driver.get("https://www.tripadvisor.in/")

		source = self.driver.page_source
		text_found = re.search('search the text', source)
		self.assertEqual(text_found, None)

	def test_options(self):
		driver=self.driver
		driver.get("https://www.tripadvisor.in/")

		#take input from file
		file_handle = open("input_data.txt", "r")
		readlines_from_file = file_handle.readlines()
		source_location = readlines_from_file[0]
		destination_location=readlines_from_file[1]
		no_of_travellers=readlines_from_file[2]

		#go to flight tab
		go_to_flight_tab=driver.find_element_by_xpath(".//*[@id='rdoFlights']/div/span")
		go_to_flight_tab.click()

		#select source location
		select_source_location=driver.find_element_by_xpath(".//*[@id='metaFlightFrom']")
		select_source_location.clear()

		select_source_location.send_keys(source_location)

		source_autocomplete = WebDriverWait(driver, 10).until(
			EC.element_to_be_clickable((By.CLASS_NAME, "autocompleter-queried")))
		source_autocomplete.click()


        #select destination location
		select_destination_location = driver.find_element_by_xpath(".//*[@id='metaFlightTo']")
		select_destination_location.clear()
		select_destination_location.send_keys(destination_location)
		destination_autocomplete = WebDriverWait(driver, 10).until(
			EC.element_to_be_clickable((By.CLASS_NAME, "autocompleter-selected")))
		destination_autocomplete.click()

		#find no of travellers

		total_travellers=driver.find_element_by_id("fadults")
		options = [x for x in total_travellers.find_elements_by_tag_name(
			"option")]
		for option in options:

			print option.get_attribute("value")
			if(option.get_attribute("value") == no_of_travellers):

				option.click()

		print driver.current_window_handle

		#hit search flight
		search_flight_button=driver.find_element_by_id("SUBMIT_FLIGHTS")
		search_flight_button.click()

		parent_window_id = driver.current_window_handle
		print parent_window_id


			#close popup
		print driver.current_window_handle
		print driver.window_handles
		cl = WebDriverWait(driver, 10).until(
			EC.element_to_be_clickable((By.XPATH, "//div[@class='ui_close_x']")))
		cl.click()

		#alert_close.click()

		# handle popup
		wait = WebDriverWait(driver, 15)
		for handle in driver.window_handles:
			print handle
			if handle != parent_window_id:
				try:
					driver.switch_to.window(handle)
					driver.close()
					driver.switch_to.window(parent_window_id)
				except:
					continue

		#more options

		more_option = WebDriverWait(driver, 20).until(
			EC.visibility_of_element_located((By.XPATH,
				".//*[@id='taplc_flight_results_sorts_0']/div[1]/span[2]/span[4]/label")))
		more_option.click()

		#select item from more
		get_item_from_more=driver.find_element_by_id("sort_sub_items")
		get_sub_sort_items=get_item_from_more.find_elements_by_class_name("sub_sort_item")
		print len(get_sub_sort_items)
		num=random.randint(0,4)
		get_sub_sort_items[num].click()

		# select random price
		k=WebDriverWait(driver,10).until(
			EC.presence_of_all_elements_located((By.CSS_SELECTOR,"span.price")))
		time.sleep(10)
		flightlist=driver.find_element_by_class_name("flightList")
		price_list_tag = flightlist.find_elements_by_css_selector("span.price")
		print len(price_list_tag)
		no=random.randint(0,(len(price_list_tag)-1))
		price_list_tag[no].click()






if __name__ == '__main__':
	unittest.main()

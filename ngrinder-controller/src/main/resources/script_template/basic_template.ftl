# -*- coding:utf-8 -*-

# A simple example using the HTTP plugin that shows the retrieval of a
# single page via HTTP. 
#
# This script is auto generated by ngrinder.
#
# @author ${user.userName}
from net.grinder.script.Grinder import grinder
from net.grinder.script import Test
from net.grinder.plugin.http import HTTPRequest
from net.grinder.plugin.http import HTTPPluginControl

test1 = Test(1, "Test1")
control = HTTPPluginControl.getConnectionDefaults()
request1 = test1.wrap(HTTPRequest())

# if you don't want that HTTPRequest follows the redirection, please modify the following option 0.
control.followRedirects = 1;
# if you want to increase the timeout, please modify the following option.
control.timeout = 3000

class TestRunner:
	def __init__(self):
		grinder.statistics.delayReports=True
		# initlialize threads 
		pass
		
	def __call__(self):
		result = request1.GET("${url}")
		# result is a HTTPClient.HTTPResult. 
		# We get the message body using the getText() method.
		# if result.getText().find("HELLO WORLD") != -1 :
		#    grinder.statistics.forLastTest.success = 1
		# else :
		#	 grinder.statistics.forLastTest.success = 0
			
		# if you want to print out log.. 
		# Don't use print keyword. This will make the output lost.
		# instead use following.
		# grinder.logger.info("Hello World")
		
		if result.getStatusCode() == 200 :
			grinder.statistics.forLastTest.success = 1
		else :
			grinder.statistics.forLastTest.success = 0
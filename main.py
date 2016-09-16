#!\Python27\python

####
## <strong>Object name</strong>: main.py <br />
## <strong>Program purpose</strong>: main controller <br />
## <strong>Author</strong>: Matthew Tse <br />
## <strong>Usage</strong>: Leverage python to control web page <br />
## <strong>Notes</strong>: Run on Apache 2.2 with CGI enabled and python 2.7.x<br />
##
####

####@class Main
####@constructor None

########
#Imports
########
import cgi
import cgitb; cgitb.enable()
import datetime, time
import MySQLdb as db
import json
import collections
from pprint import pprint

########
#Global Constants
########
#None

########
#Global Variables
########
#None

######
#Subroutines
######
#doHTMLHead():
#doHTMLTail():
#loadNavCtrl(search_ind, form_data):
#addItem(form_data):
#removeItem(form_data):
#getAllItems():
#main():
#######
#Inventory DB connection
#######    
def getDBConnectionAndCursor():
    # obtain a connection object to connect to the database
    conn = db.connect(host="localhost", user="root", passwd="", db="items")
    
    # get a cursor object with which to run queries
    cursor = conn.cursor()
    
    return conn, cursor    
#######
#Item Inventory
#######
def getAllItems():
    rtn_val = str(0)
    #open DB connection
    conn, cursor = getDBConnectionAndCursor()
    #catch all select
    sql = """
    SELECT item_id, item_name, description, qty, weight, unit, category
    from gear_library
    """
    
    try:
        ##execute select sql
        cursor.execute(sql)
        ##store return data
        data = cursor.fetchall()
        ##convert and store return data to json
        json_data = json.dumps(data)
        ##set return success string
        rtn_val = str(1)
    
    except conn.Error as msg:
        ##set return fail string
        rtn_val = str(0)
        
    #close connection 
    conn.close()
    
    ##return data if success
    if (rtn_val == "1"):
        return(json_data)
    else:
        return(rtn_val)
        
#######
#HTML Markup for Body
#######
def loadNavCtrl(search_ind, form_data, data):
    scriptImports = "<script type='text/javascript' src='imports/jquery-2.1.4.min.js'></script><br />"
    scriptImports += "<script type='text/javascript' src='imports/jquery.peek.js'></script><br />"
    scriptImports += "<script type='text/javascript' src='imports/bootstrap.js'></script><br />"
    navJS = "<script type='text/javascript' src='js/viewCtrl.js'></script><br />"
    jsInject = ""
    
    ##Load All Gear automagically to page
    if (len(data) > 1):
        jsInject = ('<script type="text/javascript">var inventory=({!s});</script>').format(data)
        
    body = "{!s}{!s}{!s}".format(scriptImports, navJS, jsInject)
            
    return(body)
    
######
#HTML Markup for Header
######
def doHTMLHead():

    print ("""
	<!DOCTYPE text/html>
	<html lang='en'>
	<head>
		<meta charset='UTF-8'>
		<title>NLA by MT</title>
		<link rel='stylesheet' href='css/mtPageReset.css'>
		<link rel='stylesheet' href='css/bootstrap.css'>
		<link rel='stylesheet' href='css/mtStlyes.css'>		
	</head><body class='body'>
    """)

######
#HTML Markup for Tail
######
def doHTMLTail():

    print("""
    <br />
    <hr />
    </body>
    </html>
    """)

######
#Main function
######
def main():

    print ("Content-Type: text/html""")
    print('')

    form = cgi.FieldStorage()

    ##create header
    doHTMLHead()
    ##instantiate global config vars
    search_ind = 0
    data = ""
    bodyContent = ""
    
    ##return all items
    data = getAllItems()
    ##generate html
    bodyContent += loadNavCtrl(search_ind, form, data)
    print (bodyContent)


    doHTMLTail()

    
######
#Main call function
######
main()

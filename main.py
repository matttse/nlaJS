#!\Python35\python

####
## <strong>Object name</strong>: main.py <br />
## <strong>Program purpose</strong>: main controller <br />
## <strong>Author</strong>: Matthew Tse <br />
## <strong>Usage</strong>: Leverage python to control web page <br />
## <strong>Notes</strong>: Run on Apache 2.2 with CGI enabled and python 3.3+<br />
##
####

####@class Main
####@constructor None

########
#Imports
########
import cgi
import cgitb; cgitb.enable()

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
#itemInventory():
#main():

#######
#Item Inventory
#######
def itemInventory():
    with open("C:/myInventory.txt", "a+") as inventoryFile:
        data = inventoryFile.readlines()
        idx = 0
        itemList = "<ul id='inventoryList'>"
        for item in data:
            idx = idx + 1
            itemList += "<li id=itemNum{!s}>{!s}</li>".format(idx, item)
        itemList += "</ul>"
    return (itemList)
#######
#Add Item Inventory
#######
def addItem(form_data):
    with open("C:/myInventory.txt", "a+") as inventoryFile:
        input_string = form_data["add_item_input"].value
        #TODO
        #search file for match, and return error if item was already found
        inventoryFile.write(input_string)
        inventoryFile.write("\n")
        inventoryFile.close()
    
#######
#Remove Item Inventory
#######
def removeItem(form_data):
    
    with open("C:/myInventory.txt", "a+") as inventoryFile:
        data = inventoryFile.readlines()

        for line in data:
            print (line.split())
        input_string = form_data["remove_item_input"].value
        #TODO
        #search file array for match, and remove match
        inventoryFile.close()
        
#######
#HTML Markup for Body
#######
def loadNavCtrl(search_ind, form_data):
    scriptImports = "<script type='text/javascript' src='imports/jquery-2.1.4.min.js'></script>"
    scriptImports += "<script type='text/javascript' src='imports/jquery.peek.js'></script>"
    scriptImports += "<script type='text/javascript' src='imports/bootstrap.js'></script>"
    navJS = "<script type='text/javascript' src='js/nlaCtrl.js'></script>"
    
    if (search_ind == 1):
        input_string = form_data["search_item"].value
        jsInject = "<script type='text/javascript'>" + "var formData = '" + input_string + "';</script>"
        jsInject += "<script type='text/javascript' src='js/form.js'></script>"

        
        body = "{!s}{!s}{!s}".format(scriptImports, navJS, jsInject)

    else:
        body = "{!s}{!s}".format(scriptImports, navJS)

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
    inventoryFile = itemInventory()
    ##create header
    doHTMLHead()
    
    search_ind = 0

    bodyContent = ""
##    bodyContent += itemInventory()
    ##parse input if needed
    if "search_item" in form:
        search_ind = 1
    elif "add_item_input" in form:
        addItem(form)
    elif "remove_item_input" in form:
        removeItem(form)
        
    bodyContent += loadNavCtrl(search_ind, form)
    print (bodyContent)


    doHTMLTail()

    
######
#Main call function
######
main()

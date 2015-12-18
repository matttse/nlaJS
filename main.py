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
import datetime, time
import sqlite3 as db

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
    filename = "C:/inventory.db"
    
    # obtain a connection object to connect to the database
    conn = db.connect(filename, uri=False)
    
    # get a cursor object with which to run queries
    cursor = conn.cursor() # ask the connection to give me a cursor object
    
    try:
##        createTblSql = ("""
##        CREATE TABLE inventory
##        (id INTEGER PRIMARY KEY AUTOINCREMENT
##        , name TEXT NOT NULL
##        , brand TEXT NOT NULL
##        , qty INTEGER NOT NULL
##        , curprice REAL
##        , purprice REAL
##        , purDt TEXT
##        , upDtTm TEXT)
##        """)
        createTblSql = ("""
        CREATE TABLE inventory
        (id INTEGER PRIMARY KEY AUTOINCREMENT
        , name TEXT NOT NULL)
        """)
        cursor.execute(createTblSql)
        conn.commit()
    except conn.Error as msg:
        print ("An error occured:", msg.args[0])
##    (brand, name, qty, curprice, purprice, purDt, upDtTm)

    return conn, cursor    
#######
#Item Inventory
#######
def getAllItems():
##    with open("C:/myInventory.txt", "r+") as inventoryFile:
##        data = inventoryFile.readlines()
##        idx = 0
##        itemList = "<ul id='inventoryList'>"
##        for item in data:
##            idx = idx + 1
##            itemList += "<li id=itemNum{!s}>{!s}</li>".format(idx, item)
##        itemList += "</ul>"
##    return (itemList)
    conn, cursor = getDBConnectionAndCursor()
    sql = """
    select *
    from inventory
    """
    cursor.execute(sql)
    data = cursor.fetchall()
    conn.close()
    return (data)

#######
#Add Item Inventory
#######
def addItem(form_data):

    rtn_val = str(0)
##    for inputItem in form_data:
    name = form_data["add_item_input"][0].value
##    brand = form_data["add_item_input"][1].value
##    qty = form_data["add_item_input"][2].value
##    curprice = form_data["add_item_input"][3].value
##    purprice = form_data["add_item_input"][4].value
##    purDt = form_data["add_item_input"][5].value
##    upDtTm = datetime.datetime.now()
    #open DB connection
    conn, cursor = getDBConnectionAndCursor()
    #set insert values statement
    sql = ("""INSERT INTO inventory(name) VALUES ('{!s}')""").format(name)#(?, ?, ?, ?, ?, ?, ?)
    try:
        #insert data
        cursor.execute(sql)
##        cursor.execute("INSERT INTO inventory(name, brand, qty, curprice, purprice, purDt) VALUES (?, ?, ?, ?, ?, ?)", (name, brand, qty, curprice, purprice, purDt))
        #commit data
        conn.commit()
        rtn_val = str(1)
    except conn.Error as msg:
        rtn_val = str(0)
        
    #close conn
    conn.close()

    return(rtn_val)
    
#######
#Remove Item Inventory
#######
def removeItem(form_data):
    
    rtn_val = str(0)
    input_string = form_data["remove_item_input"].value
    #open DB connection
    conn, cursor = getDBConnectionAndCursor()
    #set insert values statement
    sql = ("""DELETE FROM inventory WHERE name=({!s},)""").format(input_string)#(?, ?, ?, ?, ?, ?, ?)
    try:
        #insert data
##        cursor.execute(sql)
        cursor.execute("DELETE FROM inventory WHERE name=('asd',)")
        #commit data
        conn.commit()
        rtn_val = str(1)
    except conn.Error as msg:
        rtn_val = str(0)
        
    #close conn
    conn.close()

    return(rtn_val)
        
#######
#HTML Markup for Body
#######
def loadNavCtrl(search_ind, form_data, stat):
    scriptImports = "<script type='text/javascript' src='imports/jquery-2.1.4.min.js'></script>"
    scriptImports += "<script type='text/javascript' src='imports/jquery.peek.js'></script>"
    scriptImports += "<script type='text/javascript' src='imports/bootstrap.js'></script>"
    navJS = "<script type='text/javascript' src='js/nlaCtrl.js'></script>"
    jsInject = ""
    
    if (search_ind == 1):
        input_string = form_data["search_item"].value
        jsInject = "<script type='text/javascript'>" + "var formData = '" + input_string + "';</script>"
##        jsInject += "<script type='text/javascript' src='js/form.js'></script>"
        data = getAllItems()
        jsInject += ('<script type="text/javascript">')
        for record in data:
            #print record
            # unpack the record into several variables
##            name, brand, qty, curprice, purprice, purDt, upDtTm = record
            name = record
            sym = '{!s}'.format(name)

##            print (sym)
            jsInject += ('console.log("{!s}");').format(sym)
        jsInject += "</script>"
        
        body = "{!s}{!s}{!s}".format(scriptImports, navJS, jsInject)
        
    elif (stat == "1"):
        if "remove_item_input" in form_data:
            input_string = form_data["remove_item_input"][0].value
        elif "add_item_input" in form_data:
            input_string = form_data["add_item_input"][0].value
            
        jsInject = ('<script type="text/javascript">console.log("{!s}", "added");</script>').format(input_string)
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

    ##create header
    doHTMLHead()
    
    search_ind = 0
    stat = ""
    bodyContent = ""
    
    ##parse input if needed
    if "search_item" in form:
        search_ind = 1            
    elif "add_item_input" in form:
        stat = addItem(form)
##        input_string = form["add_item_input"].value
##        bodyContent += ('<script type="text/javascript">console.log("{!s}", "list");</script>').format(form["add_item_input"][0].value)
##        bodyContent += ('<script type="text/javascript">console.log("{!s}", "list");</script>').format(form["add_item_input"][1])
##        bodyContent += ('<script type="text/javascript">console.log("{!s}", "list");</script>').format(form["add_item_input"])
    elif "remove_item_input" in form:
        stat = removeItem(form)
        
    bodyContent += loadNavCtrl(search_ind, form, stat)
    print (bodyContent)


    doHTMLTail()

    
######
#Main call function
######
main()

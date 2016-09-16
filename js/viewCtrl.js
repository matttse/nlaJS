var htmlOutput = "";
//global var from main.py

/**
* Main function build page
* Usage: on ready
*/
$(function(){
	jQuery.support.cors = true;
	
    $('#body').html('Carpe Mons is loading...');

    render();
});
function generateBanner() {
	htmlOutput += "<header><hgroup>";
	htmlOutput += "<nav class='navbar navbar-default navbar-fixed-top' role='navigation'>"
					+ "<h2>"
						+ "<a id='title' href='#home'>Carpe Mons</a>"
					+"</h2>"
						+ "<div class='navbar-header'>"	
							+ "<button type='button' class='navbar-toggle' data-toggle='collapse' data-target='.navbar-collapse'>"						
								+ "<span class='icon-bar'></span>"
							+ "</button>"
						+ "</div>"
						+ "<div class='collapse navbar-collapse'>"
							+ "<ul class='navigation nav navbar-header'>"								
								+ "<li class='btn btn-inverse'><a href='#about' class='button hvr-sink' id='gearLibrary'>Gear Library</a></li>"
							+ "</ul>"
						+ "</div>"
				+ "</nav>";
	htmlOutput += "<div class='hero-images'><img src='imports/bckgroundImgs/francRidge.jpg' /></div>";
	
	htmlOutput += "</hgroup></header>";

}

function generateFooter() {
	htmlOutput += "<footer>";

	htmlOutput += "<div class='foot'>"
					+ "<a href='https://www.instagram.com/neverlost.matt/' class='btn btn-default'>Follow me on Instagram</a>"
				+ "</div>";
	htmlOutput += "</footer>";
}


function render() {
	generateBanner();
	htmlOutput += "<div class='pageCont'></div>";
	generateFooter();
	$('.body').html(htmlOutput);

	$('#title').click(function() {
		window.location.replace("main.py");
	});

	//returns gear table html
	$('#gearLibrary').click(function() {
		// $('.pageCont').empty();
		
		// $('.pageCont').load('views/inventory.html');
		var tableCont = "";
		var tableHeaders = "<tr><th>item_name</th><th>category</th><th>description</th></tr>";
		// var tableHeaders = "<tr><th>item_name</th></tr>";
		tableCont += "<table id='gearTable' border='1'>" + tableHeaders + "</table>";
		$('.pageCont').append(tableCont);
		showGearTable();
	});

	
	$('.navbar').peek();

	$(window).scroll(function() {
		var scroll = $(window).scrollTop();
		$(".hero-images img").css({
			// width: (100 + scroll/5) + "%",
			top: -(scroll/10) + "%",
			"-webkit-filter":"blur(" + (scroll/100) + "px)",
			filter: "blur(" + (scroll/100) + "px)"
		});
	})
	
}

function showGearTable() {
	// var tableCont = "";
	// // var tableHeaders = "<tr><th>item_name</th><th>category</th><th>description</th></tr>";
	// var tableHeaders = "<tr><th>item_name</th></tr>";
	// tableCont += "<table id='gearTable'>" + tableHeaders + "</table>";
	// // $('.pageCont').append(tableCont);


    $.each(inventory, function(i, item) {
		$.each(item, function(iter, col) {
			// console.log(iter);
			console.log(col);

	        	// $('<tr>').append(
	         //    // $('<td>').text(col.item_name),
	         //    // $('<td>').text(col.category),
	         //    $('<td>').text(col)).appendTo('#gearTable');
		});

    	$('<tr>').append(
        // $('<td>').text(col.item_name),
        // $('<td>').text(col.category),
        $('<td>').text(item)).appendTo('#gearTable');

        // var $tr = $('<tr>').append(
        //     $('<td>').text(item.rank),
        //     $('<td>').text(item.content),
        //     $('<td>').text(item.UID)
        // ); //.appendTo('#records_table');
        
        // console.log($tr.wrap('<p>').html());
    });
}

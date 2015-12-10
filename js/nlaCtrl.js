var htmlOutput = "";
/**
* Main function build page
* Usage: on ready
*/
$(function(){
	jQuery.support.cors = true;
	
    $('#body').html('Never Lost Adventures is loading...');

    render();
});
function generateBanner() {
	htmlOutput += "<header><hgroup>";
	htmlOutput += "<nav class='navbar navbar-default navbar-fixed-top' role='navigation'>"
					+ "<h2>"
						+ "<a id='title' href='#home'>Never Lost Adventures by Matthew Tse</a>"
					+"</h2>"
						+ "<div class='navbar-header'>"	
							+ "<button type='button' class='navbar-toggle' data-toggle='collapse' data-target='.navbar-collapse'>"						
								+ "<span class='icon-bar'></span>"
								+ "<span class='icon-bar'></span>"
								+ "<span class='icon-bar'></span>"
								+ "<span class='icon-bar'></span>"
								+ "<span class='icon-bar'></span>"
							+ "</button>"
						+ "</div>"
						+ "<div class='collapse navbar-collapse'>"
							+ "<ul class='navigation nav navbar-header'>"								
								+ "<li class='btn btn-inverse'><a href='#blog' class='button hvr-sink' id='blogButton'>Blog</a></li>"
								+ "<li class='btn btn-inverse'><a href='#tripReports' class='hvr-sink' id='tripRptButton'>Trip Reports</a></li>"
								+ "<li class='btn btn-inverse'><a href='#pictures' class='button hvr-sink' id='picButton'>Pictures</a></li>"
								+ "<li class='btn btn-inverse'><a href='#inventory' class='button hvr-sink' id='invButton'>Inventory</a></li>"		 						
								+ "<li class='btn btn-inverse'><a href='#about' class='button hvr-sink' id='aboutButton'>About</a></li>"
							+ "</ul>"
						+ "</div>"
				+ "</nav>";
	htmlOutput += "<div class='hero-images'><img src='imports/bckgroundImgs/francRidge.jpg' /></div>";
	
	htmlOutput += "</hgroup></header>";

}

function generateFooter() {
	htmlOutput += "<footer>";

	htmlOutput += "<div class='foot'>"
					+ "<a href='https://www.instagram.com/ad.venture.matt/' class='btn btn-default'>Follow me on Instagram</a>"
				+ "</div>";
	htmlOutput += "</footer>";
}


function render() {
	
	generateBanner();
	htmlOutput += "<div class='pageCont'></div>";
	generateFooter();
	$('.body').html(htmlOutput);

	$('#aboutButton').click(function() {
		window.open("https://neverlostadventures.wordpress.com/2015/12/04/never-lost-adventures-by-matt-tse/");
	});
	$('#tripRptButton').click(function() {
		$('.pageCont').empty();
		$('.pageCont').load('views/tripReports.html');
	});
	$('#picButton').click(function() {
		$('.pageCont').empty();
		$('.pageCont').load('views/pictures.html');
		
	});
	$('#invButton').click(function() {
		$('.pageCont').empty();
		$('.pageCont').load('views/inventory.html');
	});
	$('#title').click(function() {
		window.location.replace("main.py");
	});
	$('#blogButton').click(function() {
		window.location.replace("http://www.neverlostadventures.com");
		
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

$(function(){
	//listener for inventory
	$('#displayInventory').click(function() {
	//load into div
		$('#inventory').empty();
		$.ajax({
			url: "data/myInventory.txt",
			dataType: "text",
			success: function (data) {
				$.each(data.split(/[\n\r]+/), function(idx, line) {
					$('<li class="itemList">').text(line).appendTo("#inventory");
				});
			}
		})
		$('#displayInventory').hide();
		$('#hideInventory').show();
	});
	
	$('#hideInventory').click(function() {
		$('#hideInventory').hide();
		$('#inventory').empty();
		$('#displayInventory').show();
	});
	
	
});
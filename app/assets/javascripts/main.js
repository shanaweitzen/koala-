$(document).ready(function(){
	holder = $("#holder");
	if( holder.length > 0 ){

	    var pusher = new Pusher(pusher_key); 
	    var channel = pusher.subscribe('messages'); 
	    

	    channel.bind('new_message', function(data) { //reading new message from the channel the specific channel
	    	$("#messageWindow > li").last().append('<li>' + data +' </li>');
	    });
	 }	

	//mustache ///	
	$.ajax('/chats.json', {
		success: function(data){
			var template = $('#template').html();
			var renderHTML = Mustache.to_html(template, data);
			$('#holder').html(renderHTML);

			$(".message-btn").click(function(event){
				message_submit();
				event.preventDefault();
			});

			$("#message_field").keypress(function(event) {
			  	if ( event.which == 13 ) {
					message_submit();
					event.preventDefault();
				}
			});

		}
	});

});

function message_submit(){
	$('.message_field form').submit();
	$('#message_field').val("");
	return false;
}


	    	
	  
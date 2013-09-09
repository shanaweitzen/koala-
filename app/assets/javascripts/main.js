$(document).ready(function(){
	holder = $("#holder");
	if( holder.length > 0 ){

	    var pusher = new Pusher(pusher_key); 
	    var channel = pusher.subscribe('messages'); 
	    

	    channel.bind('new_message', function(data) { //reading new message from the channel the specific channel
	    	$("#messageWindow li").last().append('<li>' + data +' </li>');
	    });
	 }	

	//mustache ///	
	$.ajax('/chats.json', {
		success: function(data){
			var template = $('#template').html();
			var renderHTML = Mustache.to_html(template, data);
			$('#holder').html(renderHTML);
			$(".message-btn").on( "click", message_submit);
		}
	});

});

function message_submit(){
	user_id = $(this).data("user_id");
	text = $('#message_field').val();
	JSON_data = JSON.stringify( {"text":text, "user_id": user_id} );

    path = "/messages";
  
  $.ajax({
    type: "POST",
    url: path,
    data: JSON_data,
    contentType: "application/json"

  });
	return false;
}

	    	
	  
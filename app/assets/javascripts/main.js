///pusher ///

$(document).ready(function(){
    var pusher = new Pusher(window.pusher_key); //my pusher key
    var channel = pusher.subscribe('messages'); 
    // the channel I'm subscribing to, it could be anything


    // Enable pusher logging - don't include this in production
    Pusher.log = function(message) {
      if (window.console && window.console.log) {
        window.console.log(message);
      }
    };

    channel.bind('new_message', function(data) { //reading new message from the channel the specific channel
    	$("#messageWindow li").last().append('<li>' + data +' </li>');

			//inserts the new message as the last li
  		
  		// alert('An event was triggered with message: ' + data.text);
    });	

	//mustache ///

	var information;
		$.ajax('/chats.json', {
		success: function(data){
			var template = $('#template').html();
			console.log(data);
			var renderHTML = Mustache.to_html(template, data);
			$('#holder').html(renderHTML);
		}
	});

	function render(template){
	}

});


	    	
	  
function setThumbnail(event) {
	
	var reader = new FileReader();
	
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		$("#sample_img").attr("src",event.target.result);
	};
	
	reader.readAsDataURL(event.target.files[0]);
	
}
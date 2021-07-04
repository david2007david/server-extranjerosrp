window.onload = function(e){
        window.addEventListener('message', function(event){
var item = event.data;
            if (item !== undefined && item.type === "logod") {
if (item.display === true) {
        $("#naranja").css('display', 'flex');
        $("#naranja").animate({
        	bottom: "25%",
        	opacity: "1.0"
        	},
        	700, function() {
        });
    } else {
    	$("#naranja").animate({
        	bottom: "-50%",
        	opacity: "0.0"
        	},
        	700, function() {
        		$("#naranja").css('display', 'none');
        });
  }
    }
 if (item !== undefined && item.type === "ald") {
if (item.display === true) {
        $("#roja").css('display', 'flex');     
        $("#roja").animate({
            bottom: "25%",
            opacity: "1.0"
            },
            700, function() {
        });
    } else {
        $("#roja").animate({
            bottom: "-50%",
            opacity: "0.0"
            },
            700, function() {
                $("#roja").css('display', 'none');
        });
  }
    }
if (item !== undefined && item.type === "alt") {
if (item.display === true) {
        $("#amarilla").css('display', 'flex');      
        $("#amarilla").animate({
            bottom: "25%",
            opacity: "1.0"
            },
            700, function() {
        });
    } else {
        $("#amarilla").animate({
            bottom: "-50%",
            opacity: "0.0"
            },
            700, function() {
                $("#amarilla").css('display', 'none');
        });
  }
    }
if (item !== undefined && item.type === "alc") {
if (item.display === true) {
        $("#azul").css('display', 'flex');      
        $("#azul").animate({
            bottom: "25%",
            opacity: "1.0"
            },
            700, function() {
        });
    } else {
        $("#azul").animate({
            bottom: "-50%",
            opacity: "0.0"
            },
            700, function() {
                $("#azul").css('display', 'none');
        });
  }
  }
if (item !== undefined && item.type === "als") {
if (item.display === true) {
        $("#verde").css('display', 'flex');       
        $("#verde").animate({
            bottom: "25%",
            opacity: "1.0"
            },
            700, function() {
        });
    } else {
        $("#verde").animate({
            bottom: "-50%",
            opacity: "0.0"
            },
            700, function() {
                $("#verde").css('display', 'none');
        });
  }
    }
});
};
$(document).ready(function(){

	introMove();
	function introMove() {
		TweenLite.from($("#intro .el2"), 1, {css:{top: 210, left: 150}, delay:0.6});
		
		TweenLite.from($("#intro .el9"), 1, {css:{top: 210, left: 150}, delay:1.3});
		
		TweenLite.from($("#intro .el12"), 1, {css:{top: 210, left: 150}, delay:1.6});
		TweenLite.from($("#intro .electro"), 0.5, {css:{top: 200}, onComplete:introMoveEnd});
		$("#intro .electro").show();
	}
	function introMoveEnd(){
		eleRandomMove("start");	
	}
	var interval_ele;
	function eleRandomMove(type){
		if(type == "start"){
			clearInterval(interval_ele);
			interval_ele = setInterval(function () {
				
				TweenLite.to($("#intro .el2"), 1, {css:{top: Math.floor(Math.random() * 20 +(40)), left: Math.floor(Math.random() * 30 +(120))}});
				
				TweenLite.to($("#intro .el9"), 1, {css:{top: Math.floor(Math.random() * 10 +(210)), left: Math.floor(Math.random() * 30 +(300))}});
		
				TweenLite.to($("#intro .el12"), 1, {css:{top: Math.floor(Math.random() * 10 +(240)), left: Math.floor(Math.random() * 30 +(120))}});
			}, 800);
		}else{
			clearInterval(interval_ele);
		}
	}
});
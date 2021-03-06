		//初始化swiper
		var mySwiper=new Swiper(".swiper-container",{
			loop:true,
			pagination : '.swiper-pagination',
			autoplayDisableOnInteraction : false,
			autoplay:'3000'
		});
		
		
		var stockCopy=0; //库存
		var specLen = $('.installBox ul li').length;  //商品规格数量
		var limitNum=-1;		//限量
		var hasBuy=0;        //已经购买的份数
		var restCopy=100;	//剩余购买数量
		var carNums= 0;
		var carCanAdd = 0;	//购物车还可以添加多少份
		var packageDesc=''; //套餐说明
		
		var fullMoney='';      //满多少钱
		var cutMoney=''; 		//减多少钱
		
		var promotion="";
		var back = window.location.href;
		
		$(function(){
			$(".initloading").show();
			setTimeout(function(){
				$(".initloading").hide();
			},800);
			
			var pem = $(".protitle").find("em").html();
			if(pem != null && pem != "" && pem.length > 0){
				$(".protitle").find("h3").css("width", "4.5rem");
			}else{
				$(".protitle").find("h3").css("width", "auto");
			}
			
			 //下载占位替换
		    queryPlaceholder();
		    
			queryLikeProducts();
			
			//底部tab切换
			$('.footer li').click(function(){
				$(this).addClass('active').siblings('li').removeClass('active');
			});
			//滚动一定的距离出现返回顶部
		 	$(window).bind("scroll", function(){ 
		        var top = $(this).scrollTop(); // 当前窗口的滚动距离
		        if(top>=300){
		        	$('.backTop').show();	
		        }else{
		        	$('.backTop').hide();
		        }
		  	});
			//点击返回顶部
			$('.backTop').on('click',function(){
				$(document).scrollTop('0');
			});
			//弹出规格窗口
			$('.etalon').click(function(){
				$('#specDivLine').addClass('active');
				$('.mask').show();
			});
			
			//弹出产品参数窗口
			$('#cpcsLineId').click(function(){
				$('#cpccId').addClass('active');
				$('.mask').show();
			});
			
			//点击隐藏规格窗口
			$('.outBox,.mask').click(function(){
				hideObj();
				isActive();
// 				if (specLen > 1) {
// 					is_select = 0;
// 				}
			});
			
			function hideObj(){
				$('.standardBox').removeClass('active');
				$('.mask').hide();
			}
			
			$('#cartsId').click(function(){
				window.location.href=mainServer+'/weixin/shoppingcart/toshoppingcar';
			});
			
			//***********************规格窗口*********************************
 			//价格
// 			var oprice=$('.productPrice span').text();
// 			$('.normsPrice span').text(oprice);
			
			//选择规格
			$('.installBox li').click(function(){
				$('.calGoodNums').val(1);
				is_select = 1;
				$(this).addClass('active').siblings('li').removeClass('active');
				var standnumber=$(this).html();
				var standprice=$(this).attr("value");
				var standspecId=$(this).attr("id");
				var specValue = $(this).attr("data-orgprice");
					stockCopy=$(this).attr("data-copy");
					limitNum=$(this).attr("data-limit");
					hasBuy = $(this).attr("data-hasBuy");
					restCopy=$(this).attr("data-restCopy");
					carNums=$(this).attr("data-carNums");
					carCanAdd=$(this).attr("data-carCanAdd");
					packageDesc=$(this).attr("data-package");
					var promoitionName=$(this).attr("data-promoitionName");
					fullMoney=$(this).attr("data-fullMoney");
					cutMoney=$(this).attr("data-cutMoney");
					
				if(limitNum!=null&&limitNum!=''&&parseInt(limitNum)>=1){
					$('.normsChoose').html('已选择：'+standnumber+'(限购'+limitNum+'件)');
				}else{
					$('.normsChoose').html('已选择：'+standnumber);
				}
				$('.normsPrice span').text(standprice);
				if(specValue != null && specValue != ""){
					$('.normsPrice strong').text(specValue);
				}else{
					$('.normsPrice strong').text("");
				}
				$("#productSpecId").val(standspecId);
				$("#buyAmount").val($('.calGoodNums').val());
				
				//满减操作
				var price = standprice.substring(1,standprice.length);
				var amount = $('.calGoodNums').val();
				//计算满减
				calculateFullCut(price,amount,fullMoney,cutMoney)
				
				
				
				$('.proPic img').attr("src",$("#spec_img"+standspecId).val());
				if(stockCopy!=null&&stockCopy!=''){
					if(parseInt(stockCopy)>=1){
						$("#stockCopy").html("库存："+stockCopy+"件"); 
						$("#buyForm").show();  
					}else{
						$("#stockCopy").html("已秒完");
// 						$("#buyForm").hide();
					}
				}else{
					$("#stockCopy").html("");
				}
				if(packageDesc!=null&&packageDesc!=''){
					$("#packageDesc").html("<label>规格说明：</label>"+packageDesc);
				}else{
					$("#packageDesc").html("");
				}
				
				
				
				if(promoitionName!=null&&promoitionName!=''){
					promotion=promoitionName;
					//$('#activity').addClass("activity");
					//$('#activity').html("<p><span>满减</span><em>"+promoitionName+"</em></p>");
					$('#fullCut').addClass("activity");
					$('#fullCut').html("<p><span>满减</span><i class='subTitle'>"+promoitionName+"</i></p>");
				}else{
					promotion="";
					$('#activity').html("");
					$('#activity').removeClass("activity");
					$('#fullCut').html("");
					$('#fullCut').removeClass("activity");
					$('#fullCut').hide();
				}
				
				
				var singleCoupon=$(this).attr("data-single");
			
				var couponCount=$(this).attr("data-coupon");
				
				var content = ""
					var activityContexnt = "";
					if(singleCoupon!=""&&singleCoupon!=0){
						content+="有"+singleCoupon+"个红包可用";
					}
					if(couponCount!=""&&couponCount!=0){
						content+="+"+couponCount+"张优惠券可用";
					}
					if(promotion!=""){
						content+="+"+promotion;
					}
					
					 if(content.indexOf("+")==0){
						content=content.substring(1,content.length);
					} 
					if(content!=""){
						$("#currentActivity").show();
						activityContexnt="<p style='color:red;margin-top:5px'>"+content+"</p>";
					}else{
						$("#currentActivity").hide();
					}
					
					$('#activity').html(activityContexnt);
					
					
					
				
			});
			
			//选择规格之后才可以点击数量
			var outli=$('.installBox li');
			//增加数量
			$('.calAdd').click(function(){
				if(outli.hasClass('active')){
					var $this=$(this);
					var $numval=parseInt($(this).prev('input.calGoodNums').val());
					
			    	var maxBuy = limitNum;
			    	var buyAmount = $("#buyAmount").val();
			    	if(stockCopy!=null&&stockCopy!=''){
			    		if(parseInt(stockCopy)<=0){
			    			showvaguealert("此产品规格暂无库存");
			    			return false;
			    		}
			    	}
			    	if(parseInt(buyAmount)>=parseInt(stockCopy)){
		    			showvaguealert("库存仅剩"+stockCopy+"件");
		    			return false;
		    		}
			    	
			    	if(parseInt(limitNum)==0){
			    		showvaguealert("此产品限购不可购买");
		    			return false;
			    	}
			    	if(parseInt(limitNum)>=1){
			    		
			    		if(parseInt(restCopy)<=0){//剩余购买数量
							showvaguealert("此产品限购"+maxBuy+"份");
			    			return false;
			    		}
			    		if(parseInt(hasBuy)>= parseInt(limitNum)){
			    			showvaguealert("您已经购买了"+hasBuy+"件，不可再购买");
			    			return false;
		    			}
			    		if(parseInt(hasBuy)>0&&parseInt(buyAmount)>parseInt(restCopy)){
			    			showvaguealert("您已经购买了"+hasBuy+"件，可再购买"+restCopy+"件");
			    			return false;
			    		}
			    		if(parseInt(buyAmount)>parseInt(restCopy)){
			    			showvaguealert("此产品限购"+maxBuy+"份");
			    			return false;
			    		}
			    		
			    		if(parseInt(buyAmount)>=1){
			    				if(parseInt(maxBuy)-parseInt(hasBuy)<=parseInt(buyAmount)){
				    				showvaguealert("此产品限购"+maxBuy+"件,最多可再购买"+restCopy+"件");
					    			return false;
				    			}
			    			
			    		}
			    	}
			    		$(this).siblings('.calGoodNums').val($numval+1);
			    		$("#buyAmount").val($numval+1);
			    		var amount = $numval+1;
			    		var standprice = $('.normsPrice span').text();
			    		var price = standprice.substring(1,standprice.length);
			    		calculateFullCut(price,amount,fullMoney,cutMoney)
					
				}else{
					showvaguealert('请先选择规格');
				}
			});
			
			//减少数量
			$('.calCut').click(function(){
				if(outli.hasClass('active')){
					var $numval=parseInt($(this).next('input').val());
					if($numval<=2){
						$numval=2;
					}
					$(this).siblings('.calGoodNums').val($numval-1);
					$("#buyAmount").val($numval-1)
					var amount = $numval-1;
			    	var standprice = $('.normsPrice span').text();
			    	var price = standprice.substring(1,standprice.length);
			    	calculateFullCut(price,amount,fullMoney,cutMoney)
				}else{
					showvaguealert('请先选择规格');
				}
			});
			
			initSepc();
			
		});
		
		//关闭下载弹框
		$('.shut').click(function(){
		    var timer = Date.parse(new Date());
		    var obj = {
		        startTime:timer,
		        dowboxhide:"ok"
		    };
			$(".dowbox-wrap").fadeOut(500,function(){
				localStorage.setItem('dowboxhide',JSON.stringify(obj));
			})
		});
		
		//判断是否选择有选择规格，如果选择了规格，则更新规格数量的显示
		function isActive(){
			var oli = $('.installBox li');
			if(oli.hasClass('active')){
				is_select=1;
				var oguige = ($('.normsChoose').text()).replace('已选择：','');
				var oval = $('.calGoodNums').val();
				$('.etalon span').text(oguige);
				$('.etalon i').text('x'+oval);
				$("#buyAmount").val($('.calGoodNums').val()); 
				var price = $('.normsPrice span').text()
				//满减
				if($('#fullCut').html()!=''){
					$('#fullCut').show();
				}else{
					$('#fullCut').css("display","none");
				}
				
			}
		}
		
		
		
		
		function calculateFullCut(price,amount,fullMoney,cutMoney){
			price = parseFloat(price);
			amount =  parseFloat(amount);
			var total = parseFloat(price*amount);
			if(fullMoney!=null&&fullMoney!=''){
				fullMoney=parseFloat(fullMoney);
				if(total>=fullMoney){
					if(cutMoney!=null&&cutMoney!=''){
						cutMoney=parseFloat(cutMoney)
						total = total-cutMoney;
						total = total.toFixed(2);
						//$('.actTotal span').text("总价"+total);
						//$('.actTotal em').text("(满"+fullMoney+"减"+cutMoney+")");
					}
					
				}
			}else{
				$('.actTotal span').text("");
				$('.actTotal em').text("");
			}
		}
		
		//默认选择第一个规格，初始化价格及已选择
		function initSepc() {
			//根据推广时传过来的specId进行规格选定
			if(specId!=null&&specId!=""){
				var $this=$('.installBox li');
				$('.installBox li[id='+specId+']').click();
				
				isActive();
			}else{
				$('.installBox li:first').click();
				//更新规格数量显示
				isActive();
			}
 			
		}

		var is_select = 0;  //是否选择了规格
		var buyMS = restCopy;			//马上购买剩余的购买数量
		function toAddShotCar(type){
			
			
			if(null==customerId || 0==customerId){
				window.location.href = mainServer+"/weixin/tologin?backUrl="+back;
				return false;
			}
			
			if(null==mobile || ""==mobile){
				window.location.href = mainServer+"/weixin/usercenter/toBoundPhone?backUrl="+back;
				return false;
			}
			
			//是否有一个规格被选中
			var is_spec_active = $('.installBox ul li').hasClass('active');
			if ((is_select == 0) && (specLen > 1) && !is_spec_active) {  //没有选规格
				if ($('#specDivLine').hasClass('active')) {  //如果已经弹出选择规格框，则提示请选择规格
					showvaguealert('请选择商品规格！');
				} else {
					$('.etalon').click(); //弹出选择规格
				}
				return;
			} else if ((is_select == 0) && is_spec_active) {
				
				if (!$('#specDivLine').hasClass('active')) {  //如果已经弹出选择规格框，则提示请选择规格
					$('.etalon').click(); //弹出选择规格
					return;
				}
			}
			
	    	var productId=$("#productId").val();
	    	if(""==productId||null ==productId){
	    		showvaguealert('请重新选择商品！');
	    		return false;
	    	}
	    	
	    	var productSpecId= $("#productSpecId").val();
	    	if(null ==productSpecId || ''==productSpecId ){
	    		showvaguealert('请选择商品规格！');
	    		return false;
	    	}
	    	
	    	var buyAmount=$("#buyAmount").val();
	    	if(""==buyAmount||null ==buyAmount){
	    		showvaguealert('请选择购买数量！');
	    		return false;
	    	}
	    	if(stockCopy!=null&&stockCopy!=''){
	    		if(parseInt(stockCopy)<=0){
	    			showvaguealert("此产品规格暂无库存");
	    			return false;
	    		}
	    	}
	    	if(parseInt(buyAmount)>parseInt(stockCopy)){
	    		showvaguealert("库存仅剩"+stockCopy+"件");
	    		return false;
	    	}
	    		if(type==2){  //加入购物车
	    			var $this = $('.installBox ul li.active');
	    			stockCopy=$this.attr("data-copy");
					limitNum=$this.attr("data-limit");
					hasBuy = $this.attr("data-hasBuy");
					restCopy=$this.attr("data-restCopy");
					carNums=$this.attr("data-carNums");
					carCanAdd=$this.attr("data-carCanAdd");
					if(parseInt(limitNum)>0){//限购才走这些判断
		    			if(parseInt(carNums)>0){//大于0才限购
		    				if(parseInt(buyAmount)>parseInt(carCanAdd)){
			    				showvaguealert("您的购物车里已有"+carNums+"件，最多只能有"+limitNum+"件");
				    			return false;
				    		}
			    			
		    			}
		    			if(parseInt(hasBuy)>= parseInt(limitNum)){
			    			showvaguealert("您已经购买了"+hasBuy+"件，不可再购买");
			    			return false;
		    			}
		    			if(parseInt(buyAmount)>parseInt(restCopy)){
			    			showvaguealert("此商品限购"+limitNum+"，不可加入购物车");
			    			return false;
			    		}
		    			if(parseInt(carCanAdd)<0){
		    				showvaguealert("此产品限购"+limitNum+"份");
			    			return false;
		    			}
					}
		    		$.ajax({
			    		url:mainServer+'/weixin/shoppingcart/addShoppingCar',
			    		type:'post',
			    		dataType:'json',
			    		data:{
			    			'productId':productId,
			    			'productSpecId':productSpecId,
			    			'amount':buyAmount
			    //			'extension_type':extension_type
			    		},
			    		success:function(data){
			    			if(data.result=='succ'){
			    				var cnums=parseInt(carNums)+parseInt(buyAmount);
			    				var ccAdd = parseInt(carCanAdd)-parseInt(buyAmount);
			    				var rc= parseInt(restCopy)-parseInt(buyAmount);
			    				
			    				$this.attr("data-carNums",cnums);
			    				$this.attr("data-carCanAdd",ccAdd);
			    				$this.attr("data-restCopy",rc);
			    				var ctn = parseInt(data.cartCnt);
			    				if(ctn > 99){
			    					$("#cartsId").find("em").html("99+");
			    				}else{
			    					if(ctn == 1){
			    						$("#cartsId").append("<em>"+ctn+"</em>");
			    					}
			    					$("#cartsId").find("em").html(ctn);
			    				}
				    			if (specLen > 1) {
					    			is_select = 0;
				    			}
				    			$(".outBox").click(); //关闭商品规格弹框
			    			}
			    			showvaguealert(data.msg);
			    		}
			    	});
		    	}else if(type==1){
		    		if(parseInt(limitNum)>0){//限购才走这些判断
			    		if(parseInt(buyAmount)>parseInt(buyMS)){
			    			showvaguealert("您已经购买了"+hasBuy+"件，不可再购买");
			    			return false;
			    		}
			    		if(parseInt(hasBuy)>= parseInt(limitNum)){
			    			showvaguealert("您已经购买了"+hasBuy+"件，不可再购买");
			    			return false;
		    			}
		    			if(parseInt(buyAmount)>parseInt(limitNum)){
		    				showvaguealert("此商品限购"+limitNum+"件");
			    			return false;
		    			}
		    		}
		    		is_select = 0;
					$("#buyForm").submit();
		    	}
	    }
		
		
		//提示弹框
		function showvaguealert(con){
			$('.vaguealert').show();
			$('.vaguealert').find('p').html(con);
			setTimeout(function(){
				$('.vaguealert').hide();
			},2000);
		}
		
		//选择规格
		function checkGoodNum (value){
			if(value != null && value != ""){
				var exp = /^[1-9]\d*$/;
				if(!exp.test(value)){
					showvaguealert('只能输入正整数');
					$(".calGoodNums").val(1);
					$("#buyAmount").val(1);
					return false;
				}

				var maxBuy = limitNum;
		    	var buyAmount = $("#buyAmount").val();
		    	if(stockCopy!=null&&stockCopy!=''){
		    		if(parseInt(stockCopy)<=0){
		    			$(".calGoodNums").val(1);
		    			showvaguealert("此产品规格暂无库存");
		    			return false;
		    		}
		    	}
		    	if(parseInt(value)>=parseInt(stockCopy)){
		    		$(".calGoodNums").val(1);
	    			$("#buyAmount").val(1);
	    			showvaguealert("库存仅剩"+stockCopy+"件");
	    			return false;
	    		}
		    	
		    	if(parseInt(limitNum)==0){
		    		$(".calGoodNums").val(1);
		    		showvaguealert("此产品限购不可购买");
	    			return false;
		    	}
		    	if(parseInt(limitNum)>=1){
		    		
		    		if(parseInt(restCopy)<=0){//剩余购买数量
		    			$(".calGoodNums").val(1);
						showvaguealert("此产品限购"+maxBuy+"份");
		    			return false;
		    		}
		    		
		    		if(parseInt(hasBuy)>= parseInt(limitNum)){
		    			showvaguealert("您已经购买了"+hasBuy+"件，不可再购买");
		    			return false;
	    			}
		    		
		    		if(parseInt(hasBuy)>0&&parseInt(buyAmount)>parseInt(restCopy)){
		    			$(".calGoodNums").val(parseInt(restCopy));
    	    			$("#buyAmount").val(parseInt(stockCopy));
		    			showvaguealert("您已经购买了"+hasBuy+"件，可再购买"+restCopy+"件");
		    			return false;
		    		}
		    		if(parseInt(buyAmount)>parseInt(restCopy)){
		    			$(".calGoodNums").val(parseInt(maxBuy));
    	    			$("#buyAmount").val(parseInt(maxBuy));
		    			showvaguealert("此产品限购"+maxBuy+"份");
		    			return false;
		    		}
		    		
		    		if(parseInt(buyAmount)>=1){
		    				if(parseInt(maxBuy)-parseInt(hasBuy)<=parseInt(buyAmount)){
		    					$(".calGoodNums").val(parseInt(restCopy));
		    	    			$("#buyAmount").val(parseInt(stockCopy));
			    				showvaguealert("此产品限购"+maxBuy+"件,最多可再购买"+restCopy+"件");
				    			return false;
			    			}
		    			
		    		}
		    	}
// 	    		$(this).siblings('.calGoodNums').val(value+1);
	    		$("#buyAmount").val(parseInt(value));
	    		var standprice = $('.normsPrice span').text();
	    		var price = standprice.substring(1,standprice.length);
	    		calculateFullCut(price,parseInt(value),fullMoney,cutMoney);
			}else{
				$(".calGoodNums").val(1);
			}
		};
		
		function queryLikeProducts(){
			$.ajax({                                       
				url:mainServer+'/weixin/product/queryLikeProducts',
				type:'post',
				dataType:'json',
				success:function(data){
					if(data.code == "1010"){ //获取成功
						if(data.data == null || data.data.length <= 0){
							return;
						}
						var list = data.data;
						for (var continueIndex in list) {
							if(isNaN(continueIndex)){
								continue;
							}
							var productVo = list[continueIndex];
							
							var shareExplain = "";
							if(productVo.share_explain != null){
								shareExplain = productVo.share_explain;
								if(shareExplain.length > 25){
									shareExplain = shareExplain.substring(0, 25)+"...";
								}
							}
							var showLabel="";
							if(productVo.labelName != null && productVo.labelName != ""){
								showLabel = "<p>"+productVo.labelName+"</p>"; 
							}
							var local = mainServer+"/weixin/product/towxgoodsdetails?productId="+productVo.product_id;
							if(productVo.activityType == 2){ //限量抢购
								local = mainServer+"/weixin/product/toLimitGoodsdetails?productId="+productVo.product_id+"&specialId="+productVo.activity_id;
							}else if(productVo.activityType == 3){ //团购
								local = mainServer+"/weixin/product/toGroupGoodsdetails?specialId="+productVo.activity_id+"&productId="+productVo.product_id;
							}
							var showMoneyLine = "";
							if(productVo.activityPrice != null && productVo.activityPrice != "" && parseFloat(productVo.activityPrice) >= 0){
								showMoneyLine = "<span>￥"+checkMoneyByPoint(productVo.activityPrice)
											 + "<strong>￥"+checkMoneyByPoint(productVo.price)+"</strong></span>";
							}else if(productVo.discountPrice != null && productVo.discountPrice != "" && parseFloat(productVo.discountPrice) >= 0){
								showMoneyLine = "<span>￥"+checkMoneyByPoint(productVo.discountPrice)
								 + "<strong>￥"+checkMoneyByPoint(productVo.price)+"</strong></span>";
							}else{
								showMoneyLine = "<span>￥"+checkMoneyByPoint(productVo.price)+"</span>";
							}
							var showHtml='<div class="tuijian" onclick="location.href=\''+local+'\'">'
										+' 		<div class="left">'
										+'		<img src="'+productVo.product_logo+'" alt="" />'
										+'	</div>'
										+'	<div class="right">' 
										+'		<div class="tjname">' 
										+'		<span id="name'+productVo.product_id+'">' + productVo.product_name + '</span>'
										+		showLabel
										+'		</div>'
										+'		<div class="tjcent">'
										+			shareExplain
										+'		</div>'
										+'		<div class="tjmoney">'
										+			showMoneyLine
										+'			<p>销量'+productVo.salesVolume+'份</p>'
										+'		</div>'
										+'	</div>'
										+'</div>'
							$(".tuijianbox").append(showHtml);
							if(showLabel != null && showLabel != "" && showLabel.length > 0){
								$("#name"+productVo.product_id).css("width","3rem")    
							}else{  
								$("#name"+productVo.product_id).css("width","4rem")  
							}	
						} 
					}else{
						showvaguealert("出现异常");
					}
				},
				failure:function(data){
					showvaguealert('出错了');
				}
			});
		}
		
		function addOrCancelCollect(flag, collectionId){
			if(null==customerId || 0==customerId){
				window.location.href = mainServer+"/weixin/tologin?backUrl="+back;
				return false;
			}
			
		 	if((flag != 0 && flag != 1) || isNaN(flag)){
		 		showvaguealert("出现异常");
		 		return;
		 	}
		 	
		 	var url = mainServer+"/weixin/collection/addCollection";
		 	var data={
		 		"collectionType":1,
		 		"objId":product_id
		 	};
		 	if(flag == 1){
		 		url = mainServer+"/weixin/collection/cancelCollection";
		 		if(collectionId == null || collectionId == "" || isNaN(collectionId) || parseFloat(collectionId) <= 0){
		 			showvaguealert('出现异常啦');
		 			return;
		 		}
		 		data={
			 		"collectionId":collectionId
			 	};
		 	}
	 		$(".shou").attr("onclick", "void(0);");

	 		$.ajax({                                       
				url: url,
				data:data,
				type:'post',
				dataType:'json',
				success:function(data){
					if(data.code == "1010"){ //获取成功
						if(flag == 1){
							$(".shou").removeClass("shoucan");
							$(".shou").attr("onclick", "addOrCancelCollect(0, 0)");
							showvaguealert("已取消收藏");
						}else{
							$(".shou").attr("onclick", "addOrCancelCollect(1, "+data.data+")");
							$(".shou").addClass("shoucan");
							showvaguealert("收藏成功");
						}
					}else{
						showvaguealert(data.msg);
					}
				},
				failure:function(data){
					showvaguealert('访问出错');
				}
			});
		}
		
		
		function shareProduct(){
	 		$.ajax({                                       
				url: mainServer+"/weixin/share/addShare",
				data:{
					"shareType":1,
					"objId":product_id
				},
				type:'post',
				dataType:'json',
				success:function(data){
					showvaguealert('分享成功');
				},
				failure:function(data){
					showvaguealert('访问出错');
				}
			});
		}

	$(function(){
		$.ajax({
			url : mainServer+"/weixin/getCoupons",
			data:{
				productId:productId,
			},
			datatype : "json",
			type : "post",
			success : function(data) {
				$(".couponList").html("");
				if(data.noLogin=="noLogin"){
					$("#hongbao").hide();
				}
				$("#hongbao1").hide();
					var count=0;
					var sum = 0;
					var showContent='';
					var showContent1 = '';
					var singleCoupons=data.singleCoupons;
					if(singleCoupons!=null&&singleCoupons!=''){
						count=singleCoupons.length;
						$.each(singleCoupons,function(index,singleCoupon){
							showContent='';
							
							var singledesc = '';
							if(singleCoupon.couponContent!=null && singleCoupon.couponContent!=''){
								singledesc=singleCoupon.couponContent
							}
							showContent+="<li><h1 class='couponPrice'>¥"+singleCoupon.couponMoney+"</h1>"
											+"<div class='couponInfo'>"
												+"<p class='couponName'>"+singleCoupon.couponName+"</p>"
												+"<p>"+singledesc+"</p>"
												+"<p>有效期至"+singleCoupon.endTime+"</p>"
												+"</div>"
												+"<div class='couponPro' id='couponPro_"+singleCoupon.couponId+"'>"
						    						+"<a class='receiveBtn' onclick='getSingleCoupon("+singleCoupon.couponId+","+singleCoupon.productId+")' id='receiveBtn_"+singleCoupon.couponId+"'>立即领取</a>"
							    				+"</div>"
										+"</li>";
							
							if (sum < 2) {
								if (singleCoupon.fullMoney == 0) {
									showContent1 += "<div class='coupon'>" + checkMoneyByPoint(singleCoupon.couponMoney) + "元无门槛</div>";
								} else {
									showContent1 += "<div class='coupon'>满" + checkMoneyByPoint(singleCoupon.fullMoney) + "减" + checkMoneyByPoint(singleCoupon.couponMoney) + "</div>";
								}
								sum++;
							}
						});
					}else{
						showContent="";
						showContent1 = "";
					}
					
					
					var coupons=data.couponManagers;
					if(coupons!=null&&coupons!=''){
						count=count+coupons.length;
						$.each(coupons,function(index,coupon){
							var coupondesc="";
							if(coupon.coupon_content!=null&&coupon.coupon_content!=''){
								coupondesc = coupon.coupon_content;
							}
							showContent+="<li><h1 class='couponPrice'>¥"+coupon.coupon_money+"</h1>"
											+"<div class='couponInfo'>"
												+"<p class='couponName'>"+coupon.coupon_name+"</p>"
												+"<p>"+coupondesc+"</p>"
												+"<p>有效期"+coupon.usemax_date+"天</p>"
												+"</div>"
												+"<div class='couponPro' id='coupon_"+coupon.cm_id+"'>"
						    						+"<a class='receiveBtn' onclick='getCoupon("+coupon.cm_id+")' id='receivecmd_"+coupon.cm_id+"'>立即领取</a>"
							    				+"</div>"
										+"</li>";
							
							if (sum < 2) {
								if (coupon.usemin_money == 0) {
									showContent1 += "<div class='coupon'>" + checkMoneyByPoint(coupon.coupon_money) + "元无门槛</div>";
								} else {
									showContent1 += "<div class='coupon'>满" + checkMoneyByPoint(coupon.usemin_money) + "减" + checkMoneyByPoint(coupon.coupon_money) + "</div>";
								}
								sum++;
							}
							
						});
					}else{
						couponCount="";
					}
					if((coupons!=null ) || (singleCoupons!=null)){
						$("#hongbao1").show();
					}
//						else{
//						$("#hongbao1").show();
//					}
					
					
					
					if((coupons==null||coupons=='')&&(singleCoupons==null||singleCoupons=='')){
						$("#hongbao").hide();
						$("#couponCon").hide();
					}else{
						$("#hongbao").show();
						$("#couponCon").show();
					}
					
					$("#hongbao1").append(showContent1);
					$(".couponList").html(showContent);
					var t = "有"+count+"张优惠券/红包可领取";
					$('#youhui').addClass("youhui");
					$("#hongbaoCount").html(t);
			
			}
		});
		getPromotion($("#productSpecId").val());
				
	});;
	//促销的金币和满多少钱减多少钱
	function getPromotion(specId) {
		$.ajax({
			url : mainServer+"/weixin/product/getPromotion",
			data:{
				productId:productId,
				specId : specId
			},
			datatype : "json",
			type : "post",
			success : function(data) {
				
				var salePromotionStr = data.data.salePromotionStr;
				var productRedeemSpecStr = data.data.productRedeemSpecStr;
				if((salePromotionStr == null || salePromotionStr == '') && (productRedeemSpecStr == null || productRedeemSpecStr == '')) {
					$("#promotion").hide();
				} else {
					$("#promotion").css({
						'display':'flex'
					});
				}
				if (salePromotionStr != null && salePromotionStr != '') {
					$(".promotion").html("<span class='bor'>促销</span><span>" + salePromotionStr + "</span>");
					$(".promotion").show();
				} else {
					$(".promotion").hide();
				}
				
				if (productRedeemSpecStr != null && productRedeemSpecStr != '') {
					$(".hold").html("<span class='bor'>金币</span><span>" + productRedeemSpecStr + "</span>");
					$(".hold").show();
				} else {
					$(".hold").hide();
				}
				
				
			}
		});
	}
	
	function getSingleCoupon(couponId,productId){
		event.stopPropagation();
		$.ajax({                                       
			url: mainServer + '/weixin/customercoupon/receiveSingleCouponList',
			data:{
				"couponId":couponId,
				"productId":productId
			},
			type:'post',
			dataType:'json',
			success:function(data,event){
				if(data.code == "1010"){ //领取成功
					$(".couponPop").show();
					$("#receiveBtn_"+couponId).remove();
					var content="<span class='already'></span>"
					$("#couponPro_"+couponId).append(content);
					showvaguealert('领取成功');
					setTimeout(function(){
						window.location.reload(true) 
					},2000);
				}else if (data.hasFlag == "1"){
					showvaguealert("您已经领取过");
				}else{
					showvaguealert(data.msg);
				}
			},
			failure:function(data){
				showvaguealert('出错了');
			}
		});
	}
	
		function showRedCoupon(){
			$(".couponPop").show();
			
		}
		$(".couponPop").bind("click",function(){
			$(this).hide();
		})
		$(".receiveBtn").bind("click",function(event){
			event.stopPropagation();
		});
		
		function getCoupon(couponId){
			event.stopPropagation();
			$.ajax({                                       
				url: mainServer + '/weixin/customercoupon/receiveCoupon',
				data:{
					"cmId":couponId,
				}, 
				type:'post',
				dataType:'json',
				success:function(data){
					if(data.code == "1010"){ //领取成功
						$(".couponPop").show();
						$("#receivecmd_"+couponId).remove();
						var content="<span class='already'></span>"
						$("#coupon_"+couponId).append(content);
						showvaguealert('领取成功！');
						setTimeout(function(){
							window.location.reload(true) 
						},2000);
						
					}else{
						showvaguealert(data.msg);
					}
				},
				failure:function(data){
					showvaguealert('出错了');
				}
			});
			
		}
		
		function queryPlaceholder(){
			var url = mainServer + '/weixin/queryPlaceholder';
			$.post(url,function(data){
				if(data.code == "1010"){//说明有数据就替换下载占位
					$(".dowbox .activitytext h3").html(data.data.title);
					$(".dowbox .activitytext p").html(data.data.resume);
					$(".dowbox .dowbtn a").attr("href",data.data.linkUrl);
					$(".dowbox .dowbtn a").html("点击参与");
				}else{
					$(".dowbox .activitytext h3").html("挥货APP豪礼送不停！");
					$(".dowbox .activitytext p").html("多款美食限量抢购，低至1元！");
					$(".dowbox .dowbtn a").attr("href", mainServer + "/weixin/share/shareDownloadApp");
					$(".dowbox .dowbtn a").html("点击下载");
				}
				
				//获取缓存判断是否存在顶部下载栏显示状态
				var nowTimer = Date.parse(new Date());
				var dayTime = 60 * 60  * 1000;
				var dowflag = JSON.parse(localStorage.getItem("dowboxhide"));
				//读取缓存数据判断是否存在或者已经超过一小时
				if(null == dowflag || !dowflag || nowTimer - dowflag.startTime >= dayTime){
					localStorage.removeItem('dowboxhide');
					$('.dowbox-wrap').show();
				}else{
					$('.dowbox-wrap').hide();
				}
			});
		}
		
		
		function toOtherHome(otherCustId){
			 if(customerId != null && customerId > 0 && customerId == otherCustId){
				window.location.href = mainServer + "/weixin/socialityhome/toSocialityHome?backUrl="+back.replace("&","%26");
			 }else{
			 	window.location.href = mainServer + "/weixin/socialityhome/toOtherSocialityHome?otherCustomerId="+otherCustId+"&backUrl="+back.replace("&","%26");
			 }
		}

	$(function(){
			var bool=false;  
            setTimeout(function(){  
                  bool=true;  
            },1000); 
            
        	
	            
			pushHistory(); 
			
		    window.addEventListener("popstate", function(e) {
		    	if(bool){
		    		if(backUrl != null && backUrl != "" && backUrl != undefined){
						window.location.href = backUrl;
					}else{
						
	    				window.location.href = mainServer+"/weixin/index";
					}
		    	}
		    }, false);
		    
		    function pushHistory(){ 
		        var state = { 
	        		title: "title", 
	        		url:"#"
	        	}; 
	        	window.history.pushState(state, "title","#");  
		    }
		    
		});

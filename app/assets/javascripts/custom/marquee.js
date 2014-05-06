/**
 * @classDescription ����Marquee������ͼƬ������ͼƬ�ֻ�
 * @author Aken Li(www.kxbd.com)
 * @date 2009-07-27
 * @dependence jQuery 1.3.2
 * @DOM
 *  	<div id="marquee">
 *  		<ul>
 *   			<li></li>
 *   			<li></li>
 *  		</ul>
 *  	</div>
 * @CSS
 *  	#marquee {width:200px;height:50px;overflow:hidden;}
 * @Usage
 *  	$('#marquee').kxbdSuperMarquee(options);
 * @options
 *		distance:200,//һ�ι򶯵ľ���
 *		duration:20,//����Ч���������ƶ�ʱ�䣬ԽС�ٶ�Խ�죬Ϊ0ʱ�޻���Ч��
 *		time:5,//ͣ��ʱ�䣬��λΪ��
 *		direction: 'left',//�򶯷�����'left','right','up','down'
 *		scrollAmount:1,//����
 *		scrollDelay:20//ʱ������λΪ����
 *		isEqual:true,//���й򶯵�Ԫ�س����Ƿ�����,true,false
 *		loop: 0,//ѭ���򶯴�����0ʱ����
 *		btnGo:{left:'#goL',right:'#goR'},//���Ʒ����İ�ťID�����ĸ�����left,right,up,down�ֱ���Ӧ�ĸ�����
 *		eventGo:'click',//�����¼�
 *		controlBtn:{left:'#goL',right:'#goR'},//���Ƽ��ٹ򶯵İ�ťID�����ĸ�����left,right,up,down�ֱ���Ӧ�ĸ�����
 *		newAmount:4,//���ٹ򶯵Ĳ���
 *		eventA:'mouseenter',//�����¼�������
 *		eventB:'mouseleave',//�����¼���ԭ��
 *		navId:'#marqueeNav', //��������ID������DOM:<ul><li>1</li><li>2</li><ul>,����CSS:.navOn
 *		eventNav:'click' //�����¼�
 */
(function($){

	$.fn.kxbdSuperMarquee = function(options){
		var opts = $.extend({},$.fn.kxbdSuperMarquee.defaults, options);

		return this.each(function(){
			var $marquee = $(this);//����Ԫ������
			var _scrollObj = $marquee.get(0);//����Ԫ������DOM
			var scrollW = $marquee.width();//����Ԫ�������Ŀ���
			var scrollH = $marquee.height();//����Ԫ�������ĸ߶�
			var $element = $marquee.children(); //����Ԫ��
			var $kids = $element.children();//������Ԫ��
			var scrollSize=0;//����Ԫ�سߴ�
			var _type = (opts.direction == 'left' || opts.direction == 'right') ? 1:0;//�������ͣ�1���ң�0����
			var scrollId, rollId, isMove, marqueeId;
			var t,b,c,d,e; //�򶯶����Ĳ���,t:��ǰʱ�䣬b:��ʼ��λ�ã�c:�ı���λ�ã�d:������ʱ�䣬e:������λ��
			var _size, _len; //��Ԫ�صĳߴ�������
			var $nav,$navBtns;
			var arrPos = [];
			var numView = 0; //��ǰ������Ԫ��
			var numRoll=0; //�ֻ��Ĵ���
			var numMoved = 0;//�Ѿ��ƶ��ľ���

			//��ֹ������Ԫ�رȹ���Ԫ�ؿ���ȡ����ʵ�ʹ�����Ԫ�ؿ���
			$element.css(_type?'width':'height',10000);
			//��ȡ����Ԫ�صĳߴ�
			var navHtml = '<ul>';
			if (opts.isEqual) {
				_size = $kids[_type?'outerWidth':'outerHeight']();
				_len = $kids.length;
				scrollSize = _size * _len;
				for(var i=0;i<_len;i++){
					arrPos.push(i*_size);
					navHtml += '<li>'+ (i+1) +'</li>';
				}
			}else{
				$kids.each(function(i){
					arrPos.push(scrollSize);
					scrollSize += $(this)[_type?'outerWidth':'outerHeight']();
					navHtml += '<li>'+ (i+1) +'</li>';
				});
			}
			navHtml += '</ul>';

			//����Ԫ���ܳߴ�С�������ߴ磬������
			if (scrollSize<(_type?scrollW:scrollH)) return;
			//��¡������Ԫ�ؽ������뵽����Ԫ�غ󣬲��趨����Ԫ�ؿ���
			$element.append($kids.clone()).css(_type?'width':'height',scrollSize*2);

			//�ֻ�����
			if (opts.navId) {
				$nav = $(opts.navId).append(navHtml).hover( stop, start );
				$navBtns = $('li', $nav);
				$navBtns.each(function(i){
					$(this).bind(opts.eventNav,function(){
						if(isMove) return;
						if(numView==i) return;
						rollFunc(arrPos[i]);
						$navBtns.eq(numView).removeClass('navOn');
						numView = i;
						$(this).addClass('navOn');
					});
				});
				$navBtns.eq(numView).addClass('navOn');
			}

			//�趨��ʼλ��
			if (opts.direction == 'right' || opts.direction == 'down') {
				_scrollObj[_type?'scrollLeft':'scrollTop'] = scrollSize;
			}else{
				_scrollObj[_type?'scrollLeft':'scrollTop'] = 0;
			}

			if(opts.isMarquee){
				//�򶯿�ʼ
				//marqueeId = setInterval(scrollFunc, opts.scrollDelay);
				marqueeId = setTimeout(scrollFunc, opts.scrollDelay);
				//���껮��ֹͣ����
				$marquee.hover(
					function(){
						clearInterval(marqueeId);
					},
					function(){
						//marqueeId = setInterval(scrollFunc, opts.scrollDelay);
						clearInterval(marqueeId);
						marqueeId = setTimeout(scrollFunc, opts.scrollDelay);
					}
				);

				//���Ƽ����˶�
				if(opts.controlBtn){
					$.each(opts.controlBtn, function(i,val){
						$(val).bind(opts.eventA,function(){
							opts.direction = i;
							opts.oldAmount = opts.scrollAmount;
							opts.scrollAmount = opts.newAmount;
						}).bind(opts.eventB,function(){
							opts.scrollAmount = opts.oldAmount;
						});
					});
				}
			}else{
				if(opts.isAuto){
					//�ֻ���ʼ
					start();

					//���껮��ֹͣ�ֻ�
					$marquee.hover( stop, start );
				}

				//����ǰ����
				if(opts.btnGo){
					$.each(opts.btnGo, function(i,val){
						$(val).bind(opts.eventGo,function(){
							if(isMove == true) return;
							opts.direction = i;
							rollFunc();
							if (opts.isAuto) {
								stop();
								start();
							}
						});
					});
				}
			}

			function scrollFunc(){
				var _dir = (opts.direction == 'left' || opts.direction == 'right') ? 'scrollLeft':'scrollTop';

				if(opts.isMarquee){
					if (opts.loop > 0) {
						numMoved+=opts.scrollAmount;
						if(numMoved>scrollSize*opts.loop){
							_scrollObj[_dir] = 0;
							return clearInterval(marqueeId);
						}
					}
					var newPos = _scrollObj[_dir]+(opts.direction == 'left' || opts.direction == 'up'?1:-1)*opts.scrollAmount;
				}else{
					if(opts.duration){
						if(t++<d){
							isMove = true;
							var newPos = Math.ceil(easeOutQuad(t,b,c,d));
							if(t==d){
								newPos = e;
							}
						}else{
							newPos = e;
							clearInterval(scrollId);
							isMove = false;
							return;
						}
					}else{
						var newPos = e;
						clearInterval(scrollId);
					}
				}

				if(opts.direction == 'left' || opts.direction == 'up'){
					if(newPos>=scrollSize){
						newPos-=scrollSize;
					}
				}else{
					if(newPos<=0){
						newPos+=scrollSize;
					}
				}
				_scrollObj[_dir] = newPos;

				if(opts.isMarquee){
					marqueeId = setTimeout(scrollFunc, opts.scrollDelay);
				}else if(t<d){
					if(scrollId) clearTimeout(scrollId);
					scrollId = setTimeout(scrollFunc, opts.scrollDelay);
				}else{
					isMove = false;
				}

			};

			function rollFunc(pPos){
				isMove = true;
				var _dir = (opts.direction == 'left' || opts.direction == 'right') ? 'scrollLeft':'scrollTop';
				var _neg = opts.direction == 'left' || opts.direction == 'up'?1:-1;

				numRoll = numRoll +_neg;
				//�õ���ǰ����Ԫ�����Ų��ı䵼��CSS
				if(pPos == undefined&&opts.navId){
					$navBtns.eq(numView).removeClass('navOn');
					numView +=_neg;
					if(numView>=_len){
						numView = 0;
					}else if(numView<0){
						numView = _len-1;
					}
					$navBtns.eq(numView).addClass('navOn');
					numRoll = numView;
				}

				var _temp = numRoll<0?scrollSize:0;
				t=0;
				b=_scrollObj[_dir];
				//c=(pPos != undefined)?pPos:_neg*opts.distance;
				e=(pPos != undefined)?pPos:_temp+(opts.distance*numRoll)%scrollSize;
				if(_neg==1){
					if(e>b){
						c = e-b;
					}else{
						c = e+scrollSize -b;
					}
				}else{
					if(e>b){
						c =e-scrollSize-b;
					}else{
						c = e-b;
					}
				}
				d=opts.duration;

				//scrollId = setInterval(scrollFunc, opts.scrollDelay);
				if(scrollId) clearTimeout(scrollId);
				scrollId = setTimeout(scrollFunc, opts.scrollDelay);
			}

			function start(){
				rollId = setInterval(function(){
					rollFunc();
				}, opts.time*1000);
			}
			function stop(){
				clearInterval(rollId);
			}

			function easeOutQuad(t,b,c,d){
				return -c *(t/=d)*(t-2) + b;
			}

			function easeOutQuint(t,b,c,d){
				return c*((t=t/d-1)*t*t*t*t + 1) + b;
			}

		});
	};
	$.fn.kxbdSuperMarquee.defaults = {
		isMarquee:false,//�Ƿ�ΪMarquee
		isEqual:true,//���й򶯵�Ԫ�س����Ƿ�����,true,false
		loop: 0,//ѭ���򶯴�����0ʱ����
		newAmount:3,//���ٹ򶯵Ĳ���
		eventA:'mousedown',//�����¼�������
		eventB:'mouseup',//�����¼���ԭ��
		isAuto:true,//�Ƿ��Զ��ֻ�
		time:5,//ͣ��ʱ�䣬��λΪ��
		duration:50,//����Ч���������ƶ�ʱ�䣬ԽС�ٶ�Խ�죬Ϊ0ʱ�޻���Ч��
		eventGo:'click', //�����¼�����ǰ������
		direction: 'left',//�򶯷�����'left','right','up','down'
		scrollAmount:1,//����
		scrollDelay:10,//ʱ��
		eventNav:'click'//�����¼�
	};

	$.fn.kxbdSuperMarquee.setDefaults = function(settings) {
		$.extend( $.fn.kxbdSuperMarquee.defaults, settings );
	};

})(jQuery);

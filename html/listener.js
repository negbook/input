Vue.directive('focus', {
  // When the bound element is inserted into the DOM...
  inserted: function (el) {
    // Focus the element
    onInputLoaded(el);
  }
})
new Vue({
            el: '#app',
            data:   {
                        message: '',
						active:false,
						opacity:0,
						x:0,
						y:0
            },
			mounted () {
				  window.setDisplay = this.setDisplay;    // 方法赋值给window
				  window.setIMEPos = this.setIMEPos;
				window.setOpacity = this.setOpacity;
                window.onInputLoaded = this.onInputLoaded;
                window.clear = this.clear;
			 },
            methods:{
                        
						setDisplay (bool) {
							this.active = bool;
						},
						setIMEPos(x,y){
							this.x = x;
							this.y = y;
						},
						setOpacity(val){
							this.opacity = val;	
						},
                        clear(){
                            this.message = '';
                        },
                        onInputLoaded(obj){
                            let id = obj.id;
                            obj.focus();
                            $("#"+id).css('ime-mode','auto');
                           
                        },
                        checkSelect (event) {
                            //$.post("http://input/clear", JSON.stringify({string: this.message}));
                            //clear();
                            let target = event.currentTarget;
                            let targetId = target.id;
                            target.focus();
							var len = $("#"+targetId).val().length;
                            target.setSelectionRange(len,len);
                            $("#"+targetId).val($("#"+targetId).val());
                            
                        },
                        checkEnter (event) {
                            let target = event.currentTarget;
                            let targetId = target.id;
                            $("#"+targetId).css('ime-mode','disabled');
                            $.post("http://input/enter", JSON.stringify({string: this.message }));
                            onAction('closeInput');
                            
                        }
            },
            watch:  {
                        
                        message: function (value) { if(this.active) { $.post("http://input/update", JSON.stringify({string: value}));}}
            }
})



function onAction(action,data)
{
    switch(action){
        case 'displayInput' : {
            setDisplay(true);
            
            
            break;
        };
        case 'closeInput' : {
            setDisplay(false);
            clear();
            
            break;
        };
        case 'setIMEPos' : {

            setIMEPos(data.x,data.y);
            break;
        };
        
        default : break;
    }
}



window.onload = function(e){

window.addEventListener('message', (event) => {
    onAction(event.data.action,event.data);
    
    
    });
};


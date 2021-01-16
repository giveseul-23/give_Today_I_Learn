 window.onload = function(){
        let optOne = document.getElementById('opt1');
        let optTwo = document.getElementById('opt2');
        let optThree = document.getElementById('opt3');
        
        optOne.onclick = function(){
            optClickFuction(optOne)
        }
        
        optTwo.onclick = function(){
            optClickFuction(optTwo)
        }
        
        optThree.onclick = function(){
            optClickFuction(optThree)
        }
        
        
    }
    
    function optClickFuction(opt){
        if(opt.checked){
            clickFunction(opt);
        }else{
            notClickFuction(opt);
        }
    }
    
    function clickFunction(opt){
        totalCount = parseInt(total.value) + parseInt(opt.value);
        total.value =  totalCount;
    }
    
    function notClickFuction(opt){
        totalCount = parseInt(total.value) - parseInt(opt.value);
        total.value =  totalCount;
    }
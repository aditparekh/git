function makeCanvas(){
//get object, set properties, action

//get object - Sheet1
var canvas1= document.getElementById('canvas1');
var ctx1 = canvas1.getContext('2d');

//set properties
ctx1.font='35pt Arial';
ctx1.fillStyle = 'DeepSkyBlue';
ctx1.strokeStyle = 'DarkSlateGrey';

//action
ctx1.fillText("I Love HTML5",45,150);
ctx1.strokeText("I Love HTML5",45,150);


//get objects - Sheet2
var canvas2 = document.getElementById('canvas2');
var ctx2 = canvas2.getContext('2d');

//properties
ctx2.fillStyle = 'red';
ctx2.strokeStyle = 'black';
ctx2.lineWidth = '10';

//action
ctx2.fillRect(45,5,135,135);
ctx2.strokeRect(45,5,135,135);

ctx2.fillRect(200,150,135,135);
ctx2.strokeRect(200,150,135,135);

ctx2.fillStyle = 'grey';
ctx2.fillRect(200,5,135,135);

ctx2.fillRect(45,150,135,135);

//get objects- Sheet3
var canvas3 = document.getElementById('canvas3');
var ctx3 = canvas3.getContext('2d');

//define properties
ctx3.fillStyle='red';
ctx3.strokeStyle='black';
ctx3.lineWidth=5;

//action
ctx3.beginPath();
ctx3.moveTo(100,100);
ctx3.lineTo(150,200);
ctx3.lineTo(200,200);
ctx3.lineTo(200,290);
ctx3.lineTo(290,290);
ctx3.lineTo(290,100);
ctx3.lineTo(100,100);
ctx3.fill();
ctx3.stroke();

//get objects- Sheet4
var canvas4 = document.getElementById('canvas4');
var ctx4 = canvas4.getContext('2d');

//get properties
ctx4.fillStyle='blue';
ctx4.beginPath();
ctx4.arc(200,37.5+37.5/2,37.5/2,0,2 * Math.PI);
ctx4.fill();

ctx4.fillStyle='red';
ctx4.beginPath();
ctx4.arc(200,75+37.5,37.5,0,2 * Math.PI);
ctx4.fill();

ctx4.fillStyle='black';
ctx4.beginPath();
ctx4.arc(200,150+75,75,0,2 * Math.PI);
ctx4.fill();

//get objects - animation
var canvas5 = document.getElementById('canvas5');
var ctx5 = canvas5.getContext('2d');
var posX=0;
var posY=0;

setInterval(function(){
posX += 1;
posY += 1;
ctx5.fillStyle = 'black';
ctx5.fillRect(0,0,canvas5.width,canvas5.height);

ctx5.fillStyle = 'green';
ctx5.fillRect(posX,posY,posX+10,posY+10);


ctx5.fillStyle='white';
ctx5.beginPath();
ctx5.arc(posX,120,55,0,2 * Math.PI);
ctx5.closePath();
ctx5.fill();

ctx5.fillStyle='red';
ctx5.beginPath();
ctx5.arc(150,posY,55,0,2 * Math.PI);
ctx5.closePath();
ctx5.fill();


ctx5.fillStyle='blue';
ctx5.beginPath();
ctx5.arc(posX,posY,55,0,2 * Math.PI);
ctx5.closePath();
ctx5.fill();

},10)




}











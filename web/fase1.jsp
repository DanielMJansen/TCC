(function(){
var cnv = document.querySelector("canvas");
var ctx = cnv.getContext("2d");

var WIDTH = cnv.width, HEIGHT = cnv.height;

var LEFT = 37, UP = 38, RIGHT = 39, DOWN = 40;
var mvLeft = mvUp = mvRight = mvDown = false;

var tileSize = 64;
var tileSrcSize = 96;
var pontos = 5000;

var img = new Image();
img.src = "fase1.png";
img.addEventListener("load",function(){
requestAnimationFrame(loop,cnv);
},false);
window.onload = function() {
var secs = 600;
var id = setInterval(function(){ 
secs--; console.log(secs);
var minuto = Math.floor(secs/60);
var segundo = secs-minuto*60;
pontos= pontos-5;
$("#pontuacao").text(+pontos);
$("#tempo").text(minuto+":"+segundo);
if(secs<= 0){
clearInterval(id);
alert('Total Time: ' + secs + ' seconds');
}
}, 1000);
};
var walls = [];




var player = {
x: tileSize + 2,
y: tileSize + 2,
width: 24,
height: 32,
speed: <% out.println("10");%>,
// %=fase.getSpeed()% depois vai ser algo assim
//atributos de animaÃ§Ã£o
srcX: 0,
srcY: tileSrcSize,
countAnim: 0
};

var maze = [
[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1],
[1,1,1,0,1,1,1,0,1,1,0,0,0,1,0,0,0,0,0,0,1,1,1,1,0,1,1,0,1,1,0,1,1,0,1,1,1,1,1,1,1],
[1,0,0,0,0,0,1,0,1,1,1,1,1,1,0,1,1,1,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1],
[1,1,1,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,1],
[1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,0,0,1,1,1,1,1,1,1,1,1,0,1,0,1,1,0,0,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1],
[1,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,1,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1],
[1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,1,0,0,1,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,1,1,1,1,0,1,0,0,0,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,1,0,0,0,0,1,0,0,1,1,0,0,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,1,1,1,0,0,1,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,1,1,0,1,1,1,0,1,1,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,0,0,0,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,1,1,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,0,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,0,1,1,0,0,1,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,1,1,1,1,0,1,0,0,0,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,1,0,0,0,0,1,0,0,1,1,0,0,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,0,1,0,1,1,1,0,0,1,0,0,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
[1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
];


var T_WIDTH = maze[0].length * tileSize,
T_HEIGHT = maze.length * tileSize;

for(var row in maze){
for(var column in maze[row]){
var tile = maze[row][column];
if(tile === 1){
var wall = {
x: tileSize*column,
y: tileSize*row,
width: tileSize,
height: tileSize
};
walls.push(wall);
}
if(tile === 2){

}
}
}

var endLevelX = player.x;
var endLevelY = player.y;



var cam = {
x: 0,
y: 0,
width: WIDTH,
height: HEIGHT,
innerLeftBoundary: function(){
return this.x + (this.width*0.25);
},
innerTopBoundary: function(){
return this.y + (this.height*0.25);
},
innerRightBoundary: function(){
return this.x + (this.width*0.75);
},
innerBottomBoundary: function(){
return this.y + (this.height*0.75);
}
};

function blockRectangle(objA,objB){
var distX = (objA.x + objA.width/2) - (objB.x + objB.width/2);
var distY = (objA.y + objA.height/2) - (objB.y + objB.height/2);

var sumWidth = (objA.width + objB.width)/2;
var sumHeight = (objA.height + objB.height)/2;

if(Math.abs(distX) < sumWidth && Math.abs(distY) < sumHeight){
var overlapX = sumWidth - Math.abs(distX);
var overlapY = sumHeight - Math.abs(distY);

if(overlapX > overlapY){
objA.y = distY > 0 ? objA.y + overlapY : objA.y - overlapY;
} else {
objA.x = distX > 0 ? objA.x + overlapX : objA.x - overlapX;
}
}
}

window.addEventListener("keydown",keydownHandler,false);
window.addEventListener("keyup",keyupHandler,false);

function keydownHandler(e){
var key = e.keyCode;
switch(key){
case LEFT:
mvLeft = true;
break;
case UP:
mvUp = true;
break;
case RIGHT:
mvRight = true;
break;
case DOWN:
mvDown = true;
break;
}
}

function keyupHandler(e){
var key = e.keyCode;
switch(key){
case LEFT:
mvLeft = false;
break;
case UP:
mvUp = false;
break;
case RIGHT:
mvRight = false;
break;

case DOWN:
mvDown = false;
break;
}
}

function update(){
$("#posicao").text(player.x);
$("#posicaoy").text(player.y);
if(mvLeft && !mvRight){
player.x -= player.speed;
//ajuste de orientaÃ§Ã£o da animaÃ§Ã£o para esquerda
player.srcY = tileSrcSize + player.height * 2;
} else 
if(mvRight && !mvLeft){
player.x += player.speed;
//ajuste de orientaÃ§Ã£o da animaÃ§Ã£o para direita
player.srcY = tileSrcSize + player.height * 3;
}
if(mvUp && !mvDown){
player.y -= player.speed;
//ajuste de orientaÃ§Ã£o da animaÃ§Ã£o para cima
player.srcY = tileSrcSize + player.height * 1;
} else 
if(mvDown && !mvUp){
player.y += player.speed;
//ajuste de orientaÃ§Ã£o da animaÃ§Ã£o para baixo
player.srcY = tileSrcSize + player.height * 0;
}

//processo de animaÃ§Ã£o
if(mvLeft || mvRight || mvUp || mvDown){
player.countAnim++;

if(player.countAnim >= 40){
player.countAnim = 0;
}

player.srcX = Math.floor(player.countAnim/5) * player.width;
} else {
player.srcX = 0;
player.countAnim = 0;
}

for(var i in walls){
var wall = walls[i];
blockRectangle(player,wall);
}

if(player.x < cam.innerLeftBoundary()){
cam.x = player.x - (cam.width * 0.25);
}
if(player.y < cam.innerTopBoundary()){
cam.y = player.y - (cam.height * 0.25);
}
if(player.x + player.width > cam.innerRightBoundary()){
cam.x = player.x + player.width - (cam.width * 0.75);
}
if(player.y + player.height > cam.innerBottomBoundary()){
cam.y = player.y + player.height - (cam.height * 0.75);
}

cam.x = Math.max(0,Math.min(T_WIDTH - cam.width,cam.x));
cam.y = Math.max(0,Math.min(T_HEIGHT - cam.height,cam.y));
}

function render(){
ctx.clearRect(0,0,WIDTH,HEIGHT);
ctx.save();
ctx.translate(-cam.x,-cam.y);
for(var row in maze){
for(var column in maze[row]){
var tile = maze[row][column];
var x = column*tileSize;
var y = row*tileSize;

ctx.drawImage(
img,
tile * tileSrcSize,0,tileSrcSize,tileSrcSize,
x,y,tileSize,tileSize
);

}
}
//desenha o personagem
ctx.drawImage(
img,
player.srcX,player.srcY,player.width,player.height,
player.x,player.y,player.width,player.height
);
ctx.restore();
}

function loop(){
update();
render();
requestAnimationFrame(loop,cnv);
checkLevel();

}

<%
    HttpSession ses = request.getSession(true);
    String x = (String) ses.getAttribute("nick");
%>

function checkLevel(){
if(player.x >= 586 && player.y >= 3884){
alert("Parabens, voce passou de nivel!");
  player.x = 585;
$.get("CadastroPontuacao?nick=joao&tempo=10&pontuacao=20", function(data) {
  alert("Parabens, voce passou de nivel!");
  //window.location.replace("labirinto.jsp");
});
//$.get("CadastraPontuacao?nick="+<%=x%>+"&tempo="+secs+"&pontuacao="+pontos);
//window.location.replace("labirinto.jsp");

}
}

}());

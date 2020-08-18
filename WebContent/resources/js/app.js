/* socket\room_chat\app.js */

const app = require('express')();
const http = require('http').Server(app);
const io = require('socket.io')(http);

//chat.ejs 일때는 아래 구문을 사용
/*app.set('view engine', 'ejs');
app.set('views', './views');*/

//app.use(express.static('WebContent'));

app.get('/', (req, res) => {
	  res.sendFile(__dirname + '/chat.html');
	});

// let 구문은 블록 유효 범위를 갖는 지역 변수를 선언하며, 선언과 동시에 임의의 값으로 초기화할 수도 있다.
let room = [0,1,2,3,4];
let a = 0;

console.log(room.length);

app.get('/', (req, res) => {
  res.render('chat');
});

// 전역이벤트 disconnect
io.on('connection', (socket) => {
  socket.on('disconnect', () => {
    console.log('user disconnected');
  });


  socket.on('leaveRoom', (num, name) => {
	// 기존 방에서 나옴
    socket.leave(room[num], () => {
      console.log(name + ' leave a ' + room[num]);
      // 해당방에 이벤트출력
      io.to(room[num]).emit('leaveRoom', num, name);
    });
  });
  
  // room
  
  socket.on('joinRoom', (num, name) => {
	  
    socket.join(room[num], () => {
      console.log(name + ' join a ' + room[num] + " : " + room.length);
      // 해당 room에만 메시지 전송
      io.to(room[num]).emit('joinRoom', num, name);
    });
  });

  //해당 방에서만 메시지를 주고받음
  socket.on('chat message', (num, name, msg) => {
    a = num;
    io.to(room[a]).emit('chat message', name, msg);
  });
});

// 3002포트 청취
http.listen(3002, () => {
  console.log('Connect at 3002 4조실행중');
});
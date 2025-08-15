const WebSocket = require('ws');
const wss = new WebSocket.Server({ port: 8080 });

wss.on('connection', (ws) => {
    console.log('New client connected');

    ws.on('message', (data) => {
        const message = JSON.parse(data);
        if (message.type === 'join') {
            ws.groupId = message.groupId; // Assign client to a group
            ws.username = message.username;
        } else if (message.type === 'message') {
            // Broadcast to all clients in the same group
            wss.clients.forEach((client) => {
                if (client.readyState === WebSocket.OPEN && client.groupId === message.groupId) {
                    client.send(JSON.stringify({
                        groupId: message.groupId,
                        username: message.username,
                        message: message.message
                    }));
                }
            });
        }
    });

    ws.on('close', () => {
        console.log('Client disconnected');
    });
});

console.log('WebSocket server running on ws://localhost:8080');
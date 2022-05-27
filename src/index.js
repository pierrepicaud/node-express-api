const express = require('express');
const app = express();


const PORT = 8080;
const HOST = '127.168.1.1';

moscow_time = new Date().toLocaleString("en-US", {timeZone: "Europe/Moscow"})


app.get('/', (req, res) => {
    res.send(`${moscow_time}`);
})


app.listen(PORT, () => console.log(`Running on http://${HOST}:${PORT}`));
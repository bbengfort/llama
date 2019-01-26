const express = require('express');
const redis = require('redis');
const process = require('process');

// Create the application and redis client
const app = express();
const client = redis.createClient({
    host: 'redis-server',
    port: 6379
});

// Initialize the application
client.set('visits', 0);

// Root route handler
app.get('/', (req, res) => {
    process.exit(0);
    client.get('visits', (err, visits) => {
        res.send("Number of visits is " + visits);
        client.set('visits', parseInt(visits)+1);
    });
});

// Run the app server
app.listen(8080, () => {
    console.log("listening on port 8080");
});
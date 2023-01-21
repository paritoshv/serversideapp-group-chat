import foo from "./data.json";


function getConfig(file){

    var filepath = __dirname + '/' + file;
    return readJsonFileSync(filepath);
}

//assume that config.json is in application root

json = getConfig('config.json');
const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

app.get('/api/group-messages', (req, res) => {
    const page = req.query.page || 1;
    const pageSize = req.query.pageSize || 10;
    console.log(page);
    console.log(pageSize);
    const query = {};
    res.status(200).send(foo.Ayush)
    if (req.query.groupId) {
        query.groupId = req.query.groupId;
    }
    GroupMessage.find(query)
        .skip((page - 1) * pageSize)
        .limit(pageSize)
        .sort({ createdAt: -1 })
        .then((groupMessages) => {
            res.json({ groupMessages });
        })
        .catch((error) => {
            res.status(500).json({ error });
        });
});

app.listen(3000, () => {
    console.log('Server listening on port 3000');
  });
'use strict';

const functions = require('firebase-functions');

const nodemailer = require('nodemailer');

const express = require('express');

const bodyParser = require('body-parser');

const cors = require('cors');

let FieldValue = require('firebase-admin').firestore.FieldValue;

const app = express();

const jsonParser = bodyParser.json();

const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);



app.use(cors({origin: true}));

app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.end("Received GET request!");
});

app.get('/contactus/', (req, res) => {
    res.end("Stop xdd");
});
app.post('/contactus/', jsonParser, function (req, res) {

    const mailOptions = {
        from: "nssgenics@gmail.com",
        to: req.body.email,
        // to: "ryannpnss@gmail.com",
        subject: APP_NAME,
        html: "From: " + req.body.name +
            "<br>Email: " + req.body.email +
            "<br>Message:<br> " + req.body.message,
    };
    const mailOptions1 = {
        from: "nssgenics@gmail.com",
        to: "davenpnss@gmail.com",
        // to: "ryannpnss@gmail.com",
        subject: APP_NAME,
        html: "From: " + req.body.name +
            "<br>Email: " + req.body.email +
            "<br>Message:<br> " + req.body.message,
    };
    const mailOptions2 = {
        from: "nssgenics@gmail.com",
        to: "ryannpnss@gmail.com",
        // to: "ryannpnss@gmail.com",
        subject: APP_NAME,
        html: "From: " + req.body.name +
            "<br>Email: " + req.body.email +
            "<br>Message:<br> " + req.body.message,
    };
    const mailOptions3 = {
        from: "nssgenics@gmail.com",
        to: "yuangengnpnss@gmail.com",
        // to: "ryannpnss@gmail.com",
        subject: APP_NAME,
        html: "From: " + req.body.name +
            "<br>Email: " + req.body.email +
            "<br>Message:<br> " + req.body.message,
    };

    const mailOptions4 = {
        from: "nssgenics@gmail.com",
        to: "dave7999matthew+AppBackUpLogs@gmail.com",
        // to: "ryannpnss@gmail.com",
        subject: APP_NAME,
        html: "From: " + req.body.name +
            "<br>Email: " + req.body.email +
            "<br>Message:<br> " + req.body.message,
    };


    mailTransport.sendMail(mailOptions, function (err, info) {
        if (err)
            console.log(err);
        else
            console.log(info);
    });
    mailTransport.sendMail(mailOptions1, function (err, info) {
        if (err)
            console.log(err);
        else
            console.log(info);
    });
    mailTransport.sendMail(mailOptions2, function (err, info) {
        if (err)
            console.log(err);
        else
            console.log(info);
    });
    mailTransport.sendMail(mailOptions3, function (err, info) {
        if (err)
            console.log(err);
        else
            console.log(info);
    });
    mailTransport.sendMail(mailOptions4, function (err, info) {
        if (err)
            console.log(err);
        else
            console.log(info);
    });


    res.end("Success");
});
app.get('/attempts/', (req, res) => {
    res.end("Stop attempts endpoint xdd");
});
app.post('/attempts/', jsonParser, async function (req, res) {

    if (req.body.attempt <= 0 || !typeof req.body.question === "string") {
        res.end("Error in values")
    }

    let db = admin.firestore();
    // Writes to DB for the number of tries
    await db
        .collection(`quizStats/${req.body.question}/Attempts`)
        .add({"attempts": req.body.attempts,
            "timestamp":FieldValue.serverTimestamp() });

    //retrieve numbers

    await db.collection(`quizStats/${req.body.question}/Attempts`).get().then(async snap => {
        let size = snap.size; // will return the collection size
        let total = 0;
        snap.forEach(doc => {
            total += doc.get('attempts');
        });
        let average = total / size;
        await db
            .collection(`quiz`)
            .doc(`${req.body.question}`)
            .set({
                "average": `${average}`,
                "totalPlays": `${total}`,
                "totalCorrects": size,
                "timestamp": FieldValue.serverTimestamp()
            });
    });

    res.end(`Referencing questions: ${req.body.question}, number of attempts: ${req.body.attempts}`);
});

app.get('/quizzes/', async (req, res) => {
    let db = admin.firestore();
    let jsonQuiz = [];
    await db.collection(`quizzes`).get().then(snap => {
        snap.forEach(doc => {
            console.log(doc.data());
            jsonQuiz.push(JSON.stringify(doc.data()));
        });
    });
    res.end(jsonQuiz.toString());
});

exports.widgets = functions.https.onRequest((app));

const mailTransport = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: "nssgenics@gmail.com",
        pass: "",
    },
});
const APP_NAME = 'LEARN TECH CONTACT US';

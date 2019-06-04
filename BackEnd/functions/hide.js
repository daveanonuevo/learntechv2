const functions = require('firebase-functions');
const nodemailer = require('nodemailer');

var express = require('express');

var bodyParser = require('body-parser')

const cors = require('cors');


var app = express();

var urlencodedParser = bodyParser.urlencoded({extended: false})

var jsonParser = bodyParser.json()

app.use(cors({origin: true}));

app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.end("Received GET request!");
});


app.post('/', jsonParser, function (req, res) {

    const mailOptions = {
        from: "davenpnss@gmail.com",
        to: req.body.email,
        // to: "ryannpnss@gmail.com",
        subject: APP_NAME,
        html: "From: " + req.body.name +
            "<br>Email: " + req.body.email +
            "<br>Message:<br> " + req.body.message,
    };
    const mailOptions1 = {
        from: "davenpnss@gmail.com",
        to: "davenpnss@gmail.com",
        // to: "ryannpnss@gmail.com",
        subject: APP_NAME,
        html: "From: " + req.body.name +
            "<br>Email: " + req.body.email +
            "<br>Message:<br> " + req.body.message,
    };
    const mailOptions2 = {
        from: "davenpnss@gmail.com",
        to: "ryannpnss@gmail.com",
        // to: "ryannpnss@gmail.com",
        subject: APP_NAME,
        html: "From: " + req.body.name +
            "<br>Email: " + req.body.email +
            "<br>Message:<br> " + req.body.message,
    };
    const mailOptions3 = {
        from: "davenpnss@gmail.com",
        to: "yuangengnpnss@gmail.com",
        // to: "ryannpnss@gmail.com",
        subject: APP_NAME,
        html: "From: " + req.body.name +
            "<br>Email: " + req.body.email +
            "<br>Message:<br> " + req.body.message,
    };

    const mailOptions4 = {
        from: "davenpnss@gmail.com",
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
exports.widgets = functions.https.onRequest((app));
// import { user } from "./password.js";
// import { password } from "./password.js";
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
//
// const gmailEmail = functions.config().gmail.email;
// const gmailPassword = functions.config().gmail.password;


const mailTransport = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: "davenpnss@gmail.com",
        pass: "QU2FfNV9LiziZx7",
    },
});

const APP_NAME = 'LEARN TECH CONTACT US';
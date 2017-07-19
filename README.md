# [Aircall.io](https://aircall.io) - Backend technical test

This test is a part of our hiring process at Aircall for [backend positions](https://jobs.aircall.io). It should take you between 2 and 4 hours depending on your experience.

__Feel free to apply! Drop us a line with your Linkedin/Github/Twitter/AnySocialProfileWhereYouAreActive at jobs@aircall.io__

## Summary

The purpose of the test is to reproduce one of our use case on the backend part of Aircall: __call forwarding__.

The story is the following:

- Your company has 1 main number and calls are routes through an [IVR](https://en.wikipedia.org/wiki/Interactive_voice_response):
- If the caller presses 1, then the call is forwarded to your personal phone number (example +33123456789 or +15556667777).
- If the caller presses 2, then the caller is able to leave a voicemail.

It's 9AM in the office and first calls are coming in!

## Instructions

### Code

In this repository you'll find a simple Rails project with one model: `Call`. It represents a specific call that came in through the main number.

We won't use Company, User or Numbers model in this test.

In order to receive and route calls, you'll extend this Rails project by creating an interaction with [Twilio](https://twilio.com)'s API.

Please keep these points in mind:

- The focus of this test should be the interaction between your Rails server and Twilio on incoming calls. Do not customize forms or views in order to modify models (except if it helps you to test).
- You can add all the models you need or extend the existing ones.
- Do not add tests in your submission, except if you have extra time.
- You can add/modify as many gems as you want or change the Ruby version.
- Prepare deployment of your project on a simple Heroku dyno (for example).
- In order to test the interaction between Twilio and your local environment, you can use tunnels like ngrok.com.
- Please register a test account on [Twilio](https://twilio.com) or ask us if you need help in order to setup one (or need extra credits).
- You only need to handle inbound calls on the main number.
- Make your code as clear as possible, it should be understandable at a first glance.


### Use case

The use case we want to reproduce is the following:

- A customer is calling the main number of your company.
- If the caller presses 1, the call should be redirected (and ring) on your personal phone. You should be able to pickup and talk with the caller.
- If the caller presses 2, the caller should be able to drop a voicemail. You would like to hear this message later. 
- The call has to be logged in the database. This call history should give you some information about each call (non exhaustive, feel free to complete if needed): status of the call, duration or a link to an audio file if the caller dropped a voicemail.

### Submission

Fork this repository and send us a pull request. We'll review it and get back to you in order to talk about your code!

## Main steps

- [ ] Create a Twilio account and read the doc.

- [ ] Buy a Number on Twilio and be able to call it.

- [ ] Create Application and Twilio tools you'll use for calls.

- [ ] Extend the Call model in order to store data about calls.

- [ ] Forward incoming calls according to the previous strategies.

Contact us at jobs@aircall.io if you need more details.

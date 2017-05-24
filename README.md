# README

## Notes from the team

### Cody


### Jack
For twilio: trial accounts only allow you to send to confirmed numbers (basically just whoever is associated with the account) the text confirmation is set up to not pull the users phone number, but to the trial accounts confirmed number (mine). You should set yourself up with a trial account and change the appropriate application.yml keys and the associated number. As a workaround, 1234 or the sent code will always pass the confirmation code.
The TwilioSender.send service can take an optional parameter of a user phone number. Because of the trial limitation, you should not pass in the user phone number unless you upgrade your twilio account to allow unconfirmed number texting
### Josh

- For user authentication, we're using [sorcery](https://github.com/NoamB/sorcery)
- [this guide](https://www.sitepoint.com/magical-authentication-sorcery/) is what got it working. Top notch!


### Mark

### Sergey


## Misc resources we've used

-

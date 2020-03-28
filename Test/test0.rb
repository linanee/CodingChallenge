require 'watir'
require 'json'

browser = Watir::Browser.new :chrome
browser.goto('https://www.linkedin.com/login')


#read and parse JSON from a file
json = open("credential.json").read
parsed = JSON.parse(json)

browser.text_field(:id => 'username').set(parsed['username'])
browser.text_field(:id => 'password').set(parsed['password'])
browser.button(:type => 'submit').click

browser.li(:id => 'messaging-nav-item').click
browser.text_field(:id => 'search-conversations').set 'Michael “Fritz” Fritzius'
browser.image(:title => 'Michael &quot;Fritz&quot; Fritzius').click
browser.div(:aria_label => 'Write a message…').send_keys "Hi Fritz,
  yup, I'm doing work from home right now. What about yours?
  P.S. anyway, this is a massage I sent using watir as the answer for your Code Challenge."
browser.send_keys :enter

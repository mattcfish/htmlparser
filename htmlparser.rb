require 'open-uri'
require 'hpricot'
require_relative 'KSReward'

#get URL from ARGV
##Test URL = 'http://www.kickstarter.com/projects/stoic/the-banner-saga'
URL = ARGV[0];

#load the page
page=Hpricot(open(URL))

#get reward HTML from page
rewardDivs = page.search('div.NS-projects-reward')

#if count <= 0 , then either this is not a valid page or there are no rewards
if rewardDivs.count <= 0 
  puts "URL #{URL} is not a valid Kickstarter project page"
  exit
end

#else, make an array of objects from the DIVs
rewards = Array.new
rewardDivs.each do |div|
  title = div.at('h3 span').inner_html
  price = title[title.index('$')..-1].split[0]
  reward = div.at('p').inner_html
  r = KSReward.new(title, price, reward)
  rewards << r
end

#just some outputs to show results
puts "found #{rewards.count} rewards on the page \"#{page.at(:title).inner_html}\""

rewards.each do |reward|
	puts reward.to_s
	puts '---------------------------------'
end


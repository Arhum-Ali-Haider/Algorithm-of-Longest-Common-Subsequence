# Lottery Ticket Winning Credit Calculator

This is a Ruby script designed to calculate the winning credit for each participant in a lottery, based on the similarity between their ticket numbers and the winning ticket number. The script takes input from a comma-separated file containing participants' information and their respective ticket numbers, and then calculates the credit for each participant based on the Longest Common Subsequence (LCS) algorithm.

## Prerequisites

To run this script, you need to have Ruby installed on your system. The script uses Ruby version 3.1.0.

## Installation

1. Clone the repository from GitHub: `git clone <repository_url>`
2. Navigate to the repository directory: `cd <repository_directory>`
3. Install required Ruby gems: `bundle install`

## Usage

1. Prepare your input data: Create a comma-separated file with the following format:
   ```
   Last Name, First Name, Country, Ticket Number
   ```

2. Place the input file in the `public/` directory and name it `input.txt`.

3. Run the script from the command line:
   ```
   ruby lib/lottery.rb
   ```

4. The script will prompt you to enter the winning ticket number. After entering the winning ticket number, the script will calculate the winning credit for each participant and write the results to an output file named `output.txt` in the `public/` directory.

## Algorithm Explanation

The script uses the Longest Common Subsequence (LCS) algorithm to calculate the similarity between the winning ticket number and each participant's ticket number. The LCS algorithm finds the longest subsequence that two strings have in common without requiring consecutive positions in the original sequences.

The credit for each participant is calculated as the length of the LCS between their ticket number and the winning ticket number. The higher the LCS length, the more similar the ticket number is to the winning ticket, and hence, the higher the credit for that participant.

## Gem Dependencies

- `rails`: Ruby on Rails framework (version 7.0.4)
- `sqlite3`: SQLite database adapter for Active Record
- `puma`: Web server used in Rails applications
- `importmap-rails`: JavaScript import maps for Rails
- `turbo-rails`: Hotwire's SPA-like page accelerator
- `stimulus-rails`: Hotwire's modest JavaScript framework
- `jbuilder`: JSON API builder for Ruby
- `redis`: Redis adapter for Action Cable in production
- `tzinfo-data`: Timezone information for Windows systems
- `bootsnap`: Speeds up boot times through caching
- `debug`: Debugging gem for development and test environments
- `web-console`: Interactive console on exceptions pages (development only)
- `capybara`: Web application testing framework (test only)
- `selenium-webdriver`: WebDriver bindings for Ruby (test only)
- `webdrivers`: Downloads and installs browser drivers for testing (test only)

## Author

This script was written by Arhum Ali Haider and is available on GitHub at (https://github.com/Arhum-Ali-Haider/lcs).

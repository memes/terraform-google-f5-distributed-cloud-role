#  frozen_string_literal: true

ruby '3.3.0'

source 'https://rubygems.org'
gem 'kitchen-terraform', '~> 7.0.2'
# Nori 2.7 causes problems with inspec-gcp, so pin to 2.6
# See https://github.com/inspec/inspec-gcp/issues/596
gem 'nori', '~> 2.6.0'
group :dev do
  gem 'reek', '~> 6.3.0', require: false
  # transitive dependency via cookstyle forces rubocop 1.25
  # gem 'rubocop', '~> 1.62.1', require: false
end

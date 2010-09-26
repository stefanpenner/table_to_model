#!/usr/bin/env ruby
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'table_to_model'

TableToModel::CLI.start

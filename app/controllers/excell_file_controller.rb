require 'roo'
require 'roo-xls'
require 'base64'

class ExcellFileController < ApplicationController
  def convert
    @par = params
    base_64_encoded_data = params[:encoded_base64]
    first_row = params[:first_row].to_i
    File.open('lib/data2.xls', 'wb') do |f|
      f.write(Base64.decode64(base_64_encoded_data))
    end
    data = Roo::Spreadsheet.open('lib/data2.xls')
    headers = data.row(first_row) # get header row
    @arr = Array.new
    data.each_with_index do |row, idx|
      next if idx <= first_row # skip header
      # create hash from headers and cells
      line = Hash[[headers, row].transpose]
      @arr.append(line)
    end
    render('convert.json.jbuilder')
  end
end


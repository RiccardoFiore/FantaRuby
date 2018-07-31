class SoccersPlayer < ApplicationRecord

    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        (3..spreadsheet.last_row).each do |i|
        role=""
        if spreadsheet.row(i)[0] == "P"
            role="portiere"
        elsif spreadsheet.row(i)[0] == "D"
            role="difensore"
        elsif spreadsheet.row(i)[0] == "C"
            role="centrocampista"
        elsif spreadsheet.row(i)[0] == "A"
            role="attaccante"
        end
        SoccersPlayer.create(cognome: spreadsheet.row(i)[1],ruolo: role, quotazione: spreadsheet.row(i)[2], cod: spreadsheet.row(i)[3])
        end
    end

    def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
            when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
            when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
            when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
        else raise "Unknown file type: #{file.original_filename}"
        end
        end
    end


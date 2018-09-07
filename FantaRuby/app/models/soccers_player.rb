class SoccersPlayer < ApplicationRecord

    def self.import(file)
        if file && file.original_filename[0,42] == "Quotazioni_Fantacalcio_Ruoli_Fantagazzetta"
            spreadsheet = open_spreadsheet(file)
            (3..spreadsheet.last_row).each do |i|
                role=""
                if spreadsheet.row(i)[1] == "P"
                    role="portiere"
                elsif spreadsheet.row(i)[1] == "D"
                    role="difensore"
                elsif spreadsheet.row(i)[1] == "C"
                    role="centrocampista"
                elsif spreadsheet.row(i)[1] == "A"
                    role="attaccante"
                end
                SoccersPlayer.create(cognome: spreadsheet.row(i)[2],ruolo: role, quotazione: spreadsheet.row(i)[5], cod: spreadsheet.row(i)[0])
            end
        else
            nil
        end
    end

    def self.import_score(file)
        if file && file.original_filename[0,43] == "Voti_Fantacalcio_Stagione_2017-18_Giornata_"
            spreadsheet = open_spreadsheet(file)
            SoccersPlayer.update_all(:daily_score => 0)
            (7..spreadsheet.last_row).each do |i|
                if spreadsheet.row(i)[4] != nil
                    play=SoccersPlayer.where('cod = ?',spreadsheet.row(i)[0]).first
                    if play
                        voto = spreadsheet.row(i)[3].to_f
                        gol_fatti = spreadsheet.row(i)[4].to_f
                        gol_subiti = spreadsheet.row(i)[5].to_f
                        rig_fatti = spreadsheet.row(i)[8].to_f
                        rig_subiti = spreadsheet.row(i)[7].to_f
                        rig_parati = spreadsheet.row(i)[6].to_f
                        autogol = spreadsheet.row(i)[9].to_f
                        ammonizioni = spreadsheet.row(i)[10].to_f
                        espulsioni = spreadsheet.row(i)[11].to_f
                        assist = spreadsheet.row(i)[12] + spreadsheet.row(i)[13].to_f
                        bonus_gol_fatti = 3
                        bonus_gol_subiti = -1
                        bonus_rig_fatti = 3
                        bonus_rig_subiti = -1
                        bonus_rig_parati = 3
                        bonus_autogol = -2
                        bonus_ammonizioni = -0.5
                        bonus_espulsioni = -1
                        bonus_assist = 1
                        voto_tot = voto + bonus_gol_fatti*gol_fatti + bonus_gol_subiti*gol_subiti+rig_fatti*bonus_rig_fatti+bonus_rig_subiti*rig_subiti+bonus_rig_parati*rig_parati+bonus_autogol*autogol+bonus_ammonizioni*ammonizioni+bonus_espulsioni*espulsioni+bonus_assist*assist
                        play.update_attributes!(:daily_score => voto_tot)
                    end
                end
            end
        else
            nil
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


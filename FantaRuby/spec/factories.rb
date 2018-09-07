FactoryBot.define do
    factory :president1_a, class: User do
        email "presidentemail@random.com"
        password "password"
        roles_mask "2"
        favourite_team "Roma"
        username "president1_a"
        confirmation_token "abc"
        confirmed_at "2018-08-20 15:09:12"
        confirmation_sent_at "2018-08-20 15:06:12"
    end

    factory :admin, class: User do
        email "admin@admin"
        password "adminadmin"
        roles_mask "8"
        favourite_team "Roma"
        username "admin_1a"
        confirmation_token "abc"
        confirmed_at "2018-08-20 15:09:12"
        confirmation_sent_at "2018-08-20 15:06:12"
    end

    factory :player1_a, class: User do
        email "playeremail@random.com"
        password "password"
        roles_mask "4"
        favourite_team "Roma"
        username "player1_a"
        confirmation_token "abc"
        confirmed_at "2018-08-20 15:09:12"
        confirmation_sent_at "2018-08-20 15:06:12"
    end

    factory :player2_a, class: User do
        email "player2email@random.com"
        password "password"
        roles_mask "1"
        favourite_team "Atalanta"
        username "player1_a"
        confirmation_token "abc"
        confirmed_at "2018-08-20 15:09:12"
        confirmation_sent_at "2018-08-20 15:06:12"
    end

    factory :league1_a, class: League do
        status "Aperta"
        name "league1"
        description "league1"
        players "2"
        votes_day "1"
    end

    factory :rose1_a, class: Rose do
        inseriti "24"
    end

    factory :formazioni1_a, class: Formazioni do
    end

#Da qui in giu 24 giocatori:  3 -> s_p_p(1,2,3) || 7 -> s_p_d(1..7) || 8 -> s_p_c(1..8) || 6 s_p_a(1..6)
    factory :s_p_p1, class: SoccersPlayer do
        cod "1000"
        cognome "PORTIERE1"
        ruolo "portiere"
        quotazione "1"
        daily_score "5"
    end
    factory :s_p_p2, class: SoccersPlayer do
        cod "2000"
        cognome "PORTIERE2"
        ruolo "portiere"
        quotazione "1"
        daily_score "6"
    end
    factory :s_p_p3, class: SoccersPlayer do
        cod "3000"
        cognome "PORTIERE3"
        ruolo "portiere"
        quotazione "2"
        daily_score "7"
    end
    factory :s_p_d1, class: SoccersPlayer do
        cod "0100"
        cognome "DIFENSORE1"
        ruolo "difensore"
        quotazione "1"
        daily_score "5"
    end
    factory :s_p_d2, class: SoccersPlayer do
        cod "0200"
        cognome "DIFENSORE2"
        ruolo "difensore"
        quotazione "2"
        daily_score "6"
    end
    factory :s_p_d3, class: SoccersPlayer do
        cod "0300"
        cognome "DIFENSORE3"
        ruolo "difensore"
        quotazione "1"
        daily_score "4"
    end
    factory :s_p_d4, class: SoccersPlayer do
        cod "0400"
        cognome "DIFENSORE4"
        ruolo "difensore"
        quotazione "1"
        daily_score "5"
    end
    factory :s_p_d5, class: SoccersPlayer do
        cod "0500"
        cognome "DIFENSORE5"
        ruolo "difensore"
        quotazione "2"
        daily_score "6"
    end
    factory :s_p_d6, class: SoccersPlayer do
        cod "0600"
        cognome "DIFENSORE6"
        ruolo "difensore"
        quotazione "1"
        daily_score "6"
    end
    factory :s_p_d7, class: SoccersPlayer do
        cod "0700"
        cognome "DIFENSORE7"
        ruolo "difensore"
        quotazione "2"
        daily_score "5"
    end
    factory :s_p_c1, class: SoccersPlayer do
        cod "0010"
        cognome "CENTROCAMPISTA1"
        ruolo "centrocampista"
        quotazione "1"
        daily_score "5"
    end
    factory :s_p_c2, class: SoccersPlayer do
        cod "0020"
        cognome "CENTROCAMPISTA2"
        ruolo "centrocampista"
        quotazione "1"
        daily_score "6"
    end
    factory :s_p_c3, class: SoccersPlayer do
        cod "0030"
        cognome "CENTROCAMPISTA3"
        ruolo "centrocampista"
        quotazione "2"
        daily_score "5"
    end
    factory :s_p_c4, class: SoccersPlayer do
        cod "0040"
        cognome "CENTROCAMPISTA4"
        ruolo "centrocampista"
        quotazione "2"
        daily_score "6"
    end
    factory :s_p_c5, class: SoccersPlayer do
        cod "0050"
        cognome "CENTROCAMPISTA5"
        ruolo "centrocampista"
        quotazione "1"
        daily_score "4"
    end
    factory :s_p_c6, class: SoccersPlayer do
        cod "0060"
        cognome "CENTROCAMPISTA6"
        ruolo "centrocampista"
        quotazione "2"
        daily_score "4"
    end
    factory :s_p_c7, class: SoccersPlayer do
        cod "0070"
        cognome "CENTROCAMPISTA7"
        ruolo "centrocampista"
        quotazione "1"
        daily_score "5"
    end
    factory :s_p_c8, class: SoccersPlayer do
        cod "0080"
        cognome "CENTROCAMPISTA8"
        ruolo "centrocampista"
        quotazione "2"
        daily_score "5"
    end
    factory :s_p_a1, class: SoccersPlayer do
        cod "0001"
        cognome "ATTACCANTE1"
        ruolo "attaccante"
        quotazione "1"
        daily_score "5"
    end
    factory :s_p_a2, class: SoccersPlayer do
        cod "0002"
        cognome "ATTACCANTE2"
        ruolo "attaccante"
        quotazione "2"
        daily_score "5"
    end
    factory :s_p_a3, class: SoccersPlayer do
        cod "0003"
        cognome "ATTACCANTE3"
        ruolo "attaccante"
        quotazione "1"
        daily_score "4"
    end
    factory :s_p_a4, class: SoccersPlayer do
        cod "0004"
        cognome "ATTACCANTE4"
        ruolo "attaccante"
        quotazione "2"
        daily_score "4"
    end
    factory :s_p_a5, class: SoccersPlayer do
        cod "0005"
        cognome "ATTACCANTE5"
        ruolo "attaccante"
        quotazione "1"
        daily_score "6"
    end
    factory :s_p_a6, class: SoccersPlayer do
        cod "0006"
        cognome "ATTACCANTE6"
        ruolo "attaccante"
        quotazione "2"
        daily_score "6"
    end

end

#FactoryBot.define do
#    factory :session1, class: Session do
#        title "Session1"
#        status "2" #active
#        session_type "1.0"
#        description "Sessione di prova 1"
#        location "Roma"
#        version "1"
#    end
#    factory :master1, class: User do
#        roles_mask "1"
#        username "master1"
#        email "master1@test.com"
#        password "password"
#    end
#    factory :player1, class: User do
#        roles_mask "2"
#        username "player1"
#        email "player1@test.com"
#        password "password"
#    end
#    factory :match1, class: Match do
#        title "Match1"
#        status "false"
#        data "18/06/18"
#    end
#    factory :partecipationmatch1, class: Partecipationsmatch do
#        session_id ""
#        match_id ""
#        player_id ""
#    end
#end

FactoryBot.define do
		factory :president1, class: User do
            email "presidentemail@random.com"
            password "password"
            roles_mask "2"
            favourite_team "Roma"
            username "president1"
        end

        factory :league1, class: League do
            status "Aperta"
            name "league1"
            description "league1"
            players "1"
        end
end

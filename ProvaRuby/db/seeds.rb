# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = {
    :roles_mask => 8,
    :email => "admin@admin",
    :password => "adminadmin",
    :username => "admin"
}

formaz = {

    :player_id          => 1,
    :giornata           => 1,
    :portiere           => 1,
    :difensore1        => 1,
    :difensore2        => 1,
    :difensore3       => 1,
    :centrocampista1    => 1,
    :centrocampista2   => 1,
    :centrocampista3    => 1,
    :centrocampista4    => 1,
    :attaccante1       => 1,
    :attaccante2       => 1,
    :attaccante3      => 1,
    :riservapor        => 1,
    :riservadif        => 1,
    :riservacen        => 1,
    :riservaatt        => 1


}


sp = {
    :cod => 1,
    :cognome => "Messi",
    :ruolo => "Att",
    :quotazione => 20

}

User.create!(admin)
Formazioni.create!(formaz)
SoccersPlayer.create!(sp)

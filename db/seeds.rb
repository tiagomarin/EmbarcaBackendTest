# frozen_string_literal: true

# db/seeds.rb

# Define states and cities
brazilian_data = [
  { name: "Acre",
    cities: ["Rio Branco", "Cruzeiro do Sul", "Sena Madureira", "Tarauacá", "Feijó", "Senador Guiomard", "Mâncio Lima",
             "Rodrigues Alves", "Plácido de Castro", "Xapuri"] },
  { name: "Alagoas",
    cities: ["Maceió", "Arapiraca", "Palmeira dos Índios", "Rio Largo", "Penedo", "União dos Palmares",
             "São Miguel dos Campos", "Campo Alegre", "Delmiro Gouveia", "Marechal Deodoro"] },
  { name: "Amapá",
    cities: ["Macapá", "Santana", "Laranjal do Jari", "Oiapoque", "Porto Grande", "Mazagão", "Vitória do Jari",
             "Pedra Branca do Amapari", "Serra do Navio", "Calçoene"] },
  { name: "Amazonas",
    cities: ["Manaus", "Parintins", "Itacoatiara", "Manacapuru", "Coari", "Centro Amazonense", "Tefé", "Maués",
             "São Gabriel da Cachoeira", "Tabatinga"] },
  { name: "Bahia",
    cities: ["Salvador", "Feira de Santana", "Vitória da Conquista", "Camaçari", "Itabuna", "Juazeiro",
             "Lauro de Freitas", "Ilhéus", "Jequié", "Alagoinhas"] },
  { name: "Ceará",
    cities: ["Fortaleza", "Caucaia", "Juazeiro do Norte", "Maracanaú", "Sobral", "Crato", "Itapipoca", "Maranguape",
             "Iguatu", "Quixadá"] },
  { name: "Distrito Federal",
    cities: ["Brasília", "Taguatinga", "Ceilândia", "Samambaia", "Planaltina", "Santa Maria", "São Sebastião", "Gama",
             "Recanto das Emas", "Lago Sul"] },
  { name: "Espírito Santo",
    cities: ["Vitória", "Vila Velha", "Serra", "Cariacica", "Linhares", "Colatina", "Aracruz",
             "Cachoeiro de Itapemirim", "Viana", "Nova Venécia"] },
  { name: "Goiás",
    cities: ["Goiânia", "Aparecida de Goiânia", "Anápolis", "Rio Verde", "Luziânia", "Águas Lindas de Goiás",
             "Valparaíso de Goiás", "Trindade", "Formosa", "Novo Gama"] },
  { name: "Maranhão",
    cities: ["São Luís", "Imperatriz", "São José de Ribamar", "Timon", "Caxias", "Codó", "Paço do Lumiar",
             "Açailândia", "Bacabal", "Balsas"] },
  { name: "Mato Grosso",
    cities: ["Cuiabá", "Várzea Grande", "Rondonópolis", "Sinop", "Tangará da Serra", "Cáceres", "Sorriso",
             "Lucas do Rio Verde", "Primavera do Leste", "Barra do Garças"] },
  { name: "Mato Grosso do Sul",
    cities: ["Campo Grande", "Dourados", "Corumbá", "Três Lagoas", "Ponta Porã", "Naviraí", "Nova Andradina",
             "Aquidauana", "Sidrolândia", "Paranaíba"] },
  { name: "Minas Gerais",
    cities: ["Belo Horizonte", "Uberlândia", "Contagem", "Juiz de Fora", "Betim", "Montes Claros",
             "Ribeirão das Neves", "Uberaba", "Governador Valadares", "Ipatinga"] },
  { name: "Pará",
    cities: %w[Belém Ananindeua Santarém Marabá Parauapebas Castanhal Itaituba Cametá Bragança Abaetetuba] },
  { name: "Paraíba",
    cities: ["João Pessoa", "Campina Grande", "Santa Rita", "Patos", "Bayeux", "Sousa", "Cajazeiras", "Cabedelo",
             "Guarabira", "Mamanguape"] },
  { name: "Paraná",
    cities: ["Curitiba", "Londrina", "Maringá", "Ponta Grossa", "Cascavel", "São José dos Pinhais", "Foz do Iguaçu",
             "Colombo", "Guarapuava", "Paranaguá"] },
  { name: "Pernambuco",
    cities: ["Recife", "Jaboatão dos Guararapes", "Olinda", "Caruaru", "Petrolina", "Paulista",
             "Cabo de Santo Agostinho", "Camaragibe", "Garanhuns", "Vitória de Santo Antão"] },
  { name: "Piauí",
    cities: ["Teresina", "Parnaíba", "Picos", "Floriano", "Piripiri", "Campo Maior", "Pedro II", "Oeiras",
             "José de Freitas", "Barras"] },
  { name: "Rio de Janeiro",
    cities: ["Rio de Janeiro", "São Gonçalo", "Duque de Caxias", "Nova Iguaçu", "Niterói", "Belford Roxo",
             "São João de Meriti", "Campos dos Goytacazes", "Petrópolis", "Volta Redonda"] },
  { name: "Rio Grande do Norte",
    cities: ["Natal", "Mossoró", "Parnamirim", "São Gonçalo do Amarante", "Macaíba", "Ceará-Mirim", "Caicó", "Assu",
             "Currais Novos", "São José de Mipibu"] },
  { name: "Rio Grande do Sul",
    cities: ["Porto Alegre", "Caxias do Sul", "Pelotas", "Canoas", "Santa Maria", "Gravataí", "Viamão",
             "Novo Hamburgo", "São Leopoldo", "Rio Grande"] },
  { name: "Rondônia",
    cities: ["Porto Velho", "Ji-Paraná", "Ariquemes", "Vilhena", "Cacoal", "Rolim de Moura", "Jaru",
             "Ouro Preto do Oeste", "Pimenta Bueno", "Buritis"] },
  { name: "Roraima",
    cities: ["Boa Vista", "Rorainópolis", "Caracaraí", "Bonfim", "Cantá", "Mucajaí", "Amajari", "Alto Alegre",
             "Pacaraima", "Normandia"] },
  { name: "Santa Catarina",
    cities: ["Florianópolis", "Joinville", "Blumenau", "São José", "Criciúma", "Chapecó", "Itajaí", "Lages",
             "Jaraguá do Sul", "Palhoça"] },
  { name: "São Paulo",
    cities: ["São Paulo", "Guarulhos", "Campinas", "São Bernardo do Campo", "São José dos Campos", "Santo André",
             "Ribeirão Preto", "Osasco", "Sorocaba", "Mauá"] },
  { name: "Sergipe",
    cities: ["Aracaju", "Nossa Senhora do Socorro", "São Cristóvão", "Itabaiana", "Estância", "Lagarto",
             "Tobias Barreto", "Itabaianinha", "Simão Dias", "Nossa Senhora da Glória"] },
  { name: "Tocantins",
    cities: ["Palmas", "Araguaína", "Gurupi", "Porto Nacional", "Paraíso do Tocantins", "Araguatins",
             "Colinas do Tocantins", "Guaraí", "Tocantinópolis", "Formoso do Araguaia"] }
]

# Clear previous seeds (optional, be careful with this in production)
State.destroy_all
City.destroy_all

# Populate the database
brazilian_data.each do |state_data|
  state = State.create!(name: state_data[:name])

  state_data[:cities].each do |city_name|
    City.create!(name: city_name, state: state)
  end
end

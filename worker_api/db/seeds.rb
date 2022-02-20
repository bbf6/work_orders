Client.create!([
  {name: "Casa Ley", status: true},
  {name: "Hotel Las Palmas", status: true}
])
ClientManager.create!([
  {name: "Luis", last_name: "López", mother_last_name: "Lugo", status: true},
  {name: "Gustavo", last_name: "Gonzales", mother_last_name: "Gamez", status: true}
])
ClientBranch.create!([
  {client_id: 2, client_manager_id: 1, address: "El Encanto, 82103 Mazatlán, Sinaloa", email: nil, status: true},
  {client_id: 1, client_manager_id: 2, address: "Calle Gral Rafael Buelna Tenorio 855, Las Quintas, 80060 Culiacán Rosales, Sin.", email: "example@mail.com", status: true}
])
Thecnician.create!([
  {name: "Ana", last_name: "Agramonte", mother_last_name: "Alcacér", sex: true, birth_date: '2000-05-05', email: 'ana@mail.com', status: true},
  {name: "Roberto", last_name: "Rios", mother_last_name: "Robles", sex: true, birth_date: '1995-10-10', email: 'roberto@mail.com', status: true}
])

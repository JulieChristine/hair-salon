class Client
  attr_reader(:name_client, :stylist_id)

  define_method(:initialize) do |attributes|
    @name_client = attributes.fetch(:name_client)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_method(:==) do |another_client|
    self.name_client().==(another_client.name_client()).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name_client = client.fetch("name_client")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:name_client => name_client, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (name_client, stylist_id) VALUES ('#{@name_client}', #{@stylist_id});")
  end
end

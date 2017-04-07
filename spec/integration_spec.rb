require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('adding and viewing a new stylist', {:type => :feature}) do
    it('allows the owner to click  on a stylist and to see the clients of the stylist') do
      visit('/')
      fill_in('name', :with => 'Jane')
      click_button('Add Stylist')
      expect(page).to have_content('Jane')
    end
  end

  describe('seeing details for a single stylist', {:type => :feature}) do
    it('allows the owner to click a stylist to see their clients') do
      test_stylist = Stylist.new({:name => 'Jane', :id => nil})
      test_stylist.save()
      test_client = Client.new({:name_client => "Mrs. Chaw", :stylist_id => test_stylist.id()})
      test_client.save()
      visit('/')
      click_link(test_stylist.name())
      expect(page).to have_content(test_client.name_client())
    end
  end

  describe('adding clients to a stylist', {:type => :feature}) do
    it('allows the owner to add a client to a stylist') do
      test_stylist = Stylist.new({:name => 'Jane', :id => nil})
      test_stylist.save()
      visit("/")
      select("Jane", :from => 'Select a Stylist')
      fill_in("name_client", {:with => "Mrs. Chaw"})
      click_button("Add client")
      expect(page).to have_content("Mrs. Chaw")
    end
  end

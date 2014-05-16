class Contact
  @@all_contacts = []

  def initialize(name)
    @name = name
    @info_list = []
  end

  def Contact.create(name)
    @@all_contacts << Contact.new(name)
  end

  def name
    @name
  end

  def info_list
    @info_list
  end

  def add_info(number, email, address)
    phone = Phone.new(number)
    email = Email.new(email)
    address = Address.new(address)

    @info_list << phone.number + "\n" + email.email + "\n" + address.address
  end

  def Contact.contacts
    @@all_contacts
  end
end



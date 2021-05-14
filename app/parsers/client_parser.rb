class ClientParser < BaseParser
    keep_keys :name, :email, :contact
    translate_keys externalCode: :external_code
  end
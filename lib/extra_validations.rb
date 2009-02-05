module ExtraValidations

  EMAIL_ADDRESS_REGEX = /\A(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}\Z/i
  WEB_ADDRESS_REGEX = /\Ahttp(s)?:\/\/([-a-z0-9]+)(\.[-a-z0-9]+)*?\.([a-z]{2,5}){1}\/?([-a-zA-Z0-9?$%&+=\/]{0,255})\Z/
  UK_POSTCODE_REGEX = /\A[A-PR-UWYZ][A-HK-Y0-9][A-HJKSTUW0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}\Z/
  PHONE_NUMBER_REGEX = /\A((\+\d{1,3}(-| )?\(?\d\)?(-| )?\d{1,5})|(\(?\d{2,6}\)?))(-| )?(\d{3,4})(-| )?(\d{3,4})(( x| ext)\d{1,5}){0,1}\Z/i

  def validates_as_email_address(*args)
    args << {:with => EMAIL_ADDRESS_REGEX}.update(args.extract_options!); validates_format_of(*args)
  end
  
  def validates_as_web_address(*args)
    args << {:with => WEB_ADDRESS_REGEX}.update(args.extract_options!); validates_format_of(*args)
  end      

  def validates_as_uk_postcode(*args)
    args << {:with => UK_POSTCODE_REGEX}.update(args.extract_options!); validates_format_of(*args)
  end

  def validates_as_phone_number(*args)
    args << {:with => PHONE_NUMBER_REGEX}.update(args.extract_options!); validates_format_of(*args)
  end

end

ActiveRecord::Base.send :extend, ExtraValidations
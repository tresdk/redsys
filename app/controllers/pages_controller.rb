class PagesController < ApplicationController
  def index
  	#skip_before_action :verify_authenticity_token, only: [:confirmation]

    #
    # Formulario de salto a la pasarela de pago
    # - amount:decimal => Importe a cobrar
    # - order:string => unique identifier of the order first 4 position should be numbers,
    # the rest up to 12 positions will be ASCII characters from these ranges:
    # 30 (0) - 39 (9), 65 (A) - 90 (Z), 97 (a) - 122 (z)
    # - language:string => '001' Español, '002' Inglés...
    # - url_ok:string => url de vuelta del tpv para pago correcto
    # - url_ko:string => url de vuelta del tpv cuando ocurre un error
    #
    
      amount = '50.58'
      order = params[:order] || '0'
      language = '001'
      url_ok = '/deputamadre'
      url_ko = '/tusmuertoscabron'
      merchant_url = 'myexpogrow.net'
      merchant_name = 'myexpogrow'
      product_description = 'unas bragas de vieja'
      @tpv = Redsys::Tpv.new(amount, order, language, merchant_url, url_ok, url_ko, merchant_name, product_description)
    

  end

end

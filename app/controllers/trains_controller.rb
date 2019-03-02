class TrainsController < ApplicationController
  def index
    train = HTTParty.get('https://api.transport.nsw.gov.au/v1/tp/trip',
      :headers => {
      'Authorization': 'apikey Qm8X1VxayuuyBY1c80cJorTG8oiQRsIkmlU1',
      'x-requested-with': 'XMLHttpRequest',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      },
    :query => {
      'outputFormat': 'rapidJSON',
      'coordOutputFormat': 'ESPG:4326',
      'depArrMacro': 'dep',
      'type_origin': 'stop',
      'name_origin': 'Chatswood',
      'type_destination': 'stop',
      'name_destination': 'Central',
      'TfNSWTR': 'true',
      'wheelchair': 'on'
      })

      # parsing JSON into ruby object for iteration
      @train = JSON.parse train.body

  end
end
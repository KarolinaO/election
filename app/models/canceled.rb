class Canceled < ActiveRecord::Base
  def canceled_status
    [
        ['Nic nie zaznaczono'],
        ['Zaznaczono więcej niż 1 okienko'],
        ['Źle zaznaczono']

    ]
  end
end

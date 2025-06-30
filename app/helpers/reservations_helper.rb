module ReservationsHelper
  def converting_to_jpy(rate)
    "￥#{rate.to_s(:delimited, delimiter: ',')}"
  end
end

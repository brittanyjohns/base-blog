class Cannabinoid < ApplicationRecord
  belongs_to :strain

  def name
    display_name
  end

  def show?
    percentile_25 && percentile_25 > 0 || percentile_50 && percentile_50 > 0 || percentile_75 && percentile_75 > 0
  end
end

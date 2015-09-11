class Benzodiazepine < ActiveRecord::Base

  acts_as :drug

  # refactor this to use an array of hstore keys
  [:α1, :α2, :α3, :α4, :α5, :α6, :β1, :β2, :β3, :γ1, :γ2, :γ3].each do |subtype|
    store_accessor :affinity, subtype
  end

  def to_valium
    valium_equiv || "unknown"
  end

  def to_param
    primary_name
  end
 
end

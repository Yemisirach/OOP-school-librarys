require_relative './basedecor'
class CapitalizeDecorator < BaseDecor
  def correct_name
    up = @nameable.correct_name
    up.capitalize
  end
end

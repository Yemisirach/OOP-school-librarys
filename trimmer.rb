require_relative './basedecor'
class TrimmerDecorator < BaseDecor
  def trim
    @nameable.correct_name.slice(0, 10)
  end
end

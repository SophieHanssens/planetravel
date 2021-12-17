class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def accept?
    record.planet.user == user
  end

  def reject?
    record.planet.user == user
  end
end

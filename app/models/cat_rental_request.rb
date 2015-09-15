# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer
#  start_date :date
#  end_date   :date
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ActiveRecord::Base

  STATUSES = %w(PENDING APPROVED DENIED)

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUSES, message: "%{value} is not a valid status" }
  validate :no_overlapping_approved_requests

  belongs_to :cat

  def overlapping_requests
    params = self.attributes
    results = []

    CatRentalRequest.where(cat_id: cat_id).
    where(<<-SQL, {start_date: start_date, end_date: end_date, id: id})
      id != :id
    AND
    (
        start_date BETWEEN :start_date AND :end_date
      OR
        :start_date BETWEEN start_date AND end_date
    )
    SQL
  end


  def overlapping_approved_requests
    overlapping_requests.where(status: :APPROVED)
  end

  def no_overlapping_approved_requests
    unless overlapping_approved_requests.empty?
      errors[:dates] << "cannot approve two overlapping requests"
    end
  end

end

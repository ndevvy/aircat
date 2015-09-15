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


  def overlapping_requests
    params = self.attributes
    results = []
    
    results << CatRentalRequest.where(
    "start_date BETWEEN :start_date AND :end_date
    AND cat_id = :cat_id AND id != :id",
    { start_date: params["start_date"], end_date: params["end_date"], cat_id: params["cat_id"], id: params["id"] }
    )

    results << CatRentalRequest.where(
    ":start_date BETWEEN start_date AND end_date
    AND :cat_id = cat_id AND id != :id",
    { start_date: params["start_date"], end_date: params["end_date"], cat_id: params["cat_id"], id: params["id"] }
    )

  end

    # results = CatRentalRequest.find_by_sql(<<-SQL)
    #   SELECT
    #     *
    #   FROM
    #     cat_rental_requests
    #   WHERE
    #     cat_rental_requests.start_date BETWEEN #{self.start_date} AND #{self.end_date}
    #     OR #{self.start_date} BETWEEN cat_rental_requests.start_date
    #     AND cat_rental_requests.end_date AND #{self.id} != cat_rental_requests.id
    #     AND #{self.cat_id} = .cat_id
    # SQL

  def overlapping_approved_requests
    overlapping_requests.select { |request| request.rental_a_status == "APPROVED" && request.rental_b_status == "APPROVED"}
  end

end

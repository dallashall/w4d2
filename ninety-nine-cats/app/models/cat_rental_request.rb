# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :datetime         not null
#  end_date   :datetime         not null
#  status     :string           default("PENDING"), not null
#

class CatRentalRequest < ActiveRecord::Base

  # validate :overlapping_requests, ""
  # validate :overlapping_approved_requests, "Cat can't be in more than 1 place at a time"
  belongs_to :cat, :dependent => :destroy

  validate :overlapping

  def overlapping_requests
    # select rows where the requested start and end dates are between start and end dates the table
    CatRentalRequest.select("*").where.not(id: self.id).where("'#{self.start_date}' BETWEEN start_date AND end_date OR '#{self.end_date}' BETWEEN start_date AND end_date")
  end

  def overlapping_approved_requests
    # select approved overlapping requests
    overlapping_requests.select('*').where(status: "APPROVED")
  end

  def overlapping
    self.errors.add(:start_date, message: "Cat can't be in more than 1 place at a time") if overlapping_approved_requests.length > 0
  end
end

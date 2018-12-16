class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  belongs_to :user

  scope :recent, -> {order(created_at: :desc)}
  #繰り返し利用される絞り込み条件を読みやすくする。recentというメソッドを用意した

  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end

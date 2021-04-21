module Spree
  class Menu < Spree::Base
    has_many :menu_items, dependent: :destroy
    has_and_belongs_to_many :stores

    validates :name, presence: true
    validates :unique_code, presence: true, uniqueness: true

    scope :by_store, ->(store) { joins(:stores).where('store_id = ?', store) }
    scope :by_unique_code, ->(menu_code) { where unique_code: menu_code }
  end
end
class Event < ApplicationRecord
	validates_presence_of :name
	has_many :attendees, ->{ order("id DESC")} #複數
	has_one :location 
	belongs_to :category, :optional => true
	has_many :event_groupships
	has_many :group, :through => :event_groupships
	delegate :name, :to => :category, :prefix => true, :allow_nil => true
	accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank
end

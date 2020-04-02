class Friendship < ApplicationRecord
		belongs_to :predator, class_name: "User"
		belongs_to :prey, class_name: "User"
end

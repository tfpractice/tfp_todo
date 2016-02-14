module ListsHelper
	def getNewListTask(list)
		@task = list.tasks.new
	end
end

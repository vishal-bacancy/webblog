class EmailsWorker
	include Sidekiq::Worker
	sidekiq_options retry: false

	def perform(user_id,type)

		user = User.find(user_id)
		#ApplicationMailer.new_comment(user).deliver_now 
		
		if type == 1
		ApplicationMailer.new_comment(user).deliver_now 	

		else
		ApplicationMailer.new_reply(user).deliver_now 
		end


	end


end
class ProgramsController < ApplicationController
	def index
		@programs = Program.where("existing = ?", true)
		@programs
	end

	def new
		@program = Program.new
	end

	def create
		@program = Program.create!(program_params)
		redirect_to action: 'index', controller: 'welcome'
	end

	def submitted_programs
<<<<<<< HEAD
		@programs = Program.where("approved = ?", "pending")
=======
		@programs = Program.where("approval = ?", 'pending')
		@programs
	end

	def show
		@programs = Program.all
>>>>>>> d97a08e5c09480a7202a62043b62a45b6b59d66a
		@programs
	end

	def show
		@program = Program.find_by(id: params[:id])
		@program
		# render json: @program 
		render layout: false
	end

	private

	def program_params
<<<<<<< HEAD
		params[:program].permit(:description).merge({existing: false, approved: "pending"})
	end


end
=======
		params[:program].permit(:description).merge({existing: false, approval: 'approved' || :params[:approval]})
	end

end
>>>>>>> d97a08e5c09480a7202a62043b62a45b6b59d66a

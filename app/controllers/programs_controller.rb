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
		@programs = Program.where("approval = ?", 'pending')
		@programs
	end

	def fund
		@programs = Program.all
		@programs
	end

	def show
		@program = Program.find_by(id: params[:id])
		@program
		render layout: false
	end

	def donate
  	@program = Program.find(params[:id])
  	@program.donations.create
  	redirect_to(programs_path)
 end

	private

	def program_params

		params[:program].permit(:description).merge({existing: false, approval: 'approved' || :params[:approval]})
	end

end


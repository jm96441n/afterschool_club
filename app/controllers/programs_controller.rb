class ProgramsController < ApplicationController

	def index
		@programs = Program.all
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
		@programs = Program.where("approved = ?", false)
		@programs
	end

	private

	def program_params
		params[:program].permit(:description).merge({existing: false, approved: false})
	end

end
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
		@programs = Program.where("approved = ?", "pending")
		@programs
	end

	def show
		@program = Program.find_by(id: params[:id])
		@program
	end

	private

	def program_params
		params[:program].permit(:description).merge({existing: false, approved: "pending"})
	end


end
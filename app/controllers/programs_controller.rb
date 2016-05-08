class ProgramsController < ApplicationController

	def index
		@programs = Program.all
		@programs
	end

end
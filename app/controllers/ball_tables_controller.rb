class BallTablesController < ApplicationController
  # GET /ball_tables
  # GET /ball_tables.json
  def index
    @ball_tables = BallTable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ball_tables }
    end
  end

  # GET /ball_tables/1
  # GET /ball_tables/1.json
  def show
    @ball_table = BallTable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ball_table }
    end
  end

  # GET /ball_tables/new
  # GET /ball_tables/new.json
  def new
    @ball_table = BallTable.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ball_table }
    end
  end

  # GET /ball_tables/1/edit
  def edit
    @ball_table = BallTable.find(params[:id])
  end

  # POST /ball_tables
  # POST /ball_tables.json
  def create
    @ball_table = BallTable.new(params[:ball_table])

    respond_to do |format|
      if @ball_table.save
        format.html { redirect_to @ball_table, notice: 'Ball table was successfully created.' }
        format.json { render json: @ball_table, status: :created, location: @ball_table }
      else
        format.html { render action: "new" }
        format.json { render json: @ball_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ball_tables/1
  # PUT /ball_tables/1.json
  def update
    @ball_table = BallTable.find(params[:id])

    respond_to do |format|
      if @ball_table.update_attributes(params[:ball_table])
        format.html { redirect_to @ball_table, notice: 'Ball table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ball_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ball_tables/1
  # DELETE /ball_tables/1.json
  def destroy
    @ball_table = BallTable.find(params[:id])
    @ball_table.destroy

    respond_to do |format|
      format.html { redirect_to ball_tables_url }
      format.json { head :no_content }
    end
  end
end
